import java.lang.StringBuilder.*;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import org.sql2o.*;

public class Task {
  private int id;
  private String description;
  private boolean complete;
  private String due_by;

  public int getId() {
    return id;
  }

  public String getDescription() {
    return description;
  }

  public boolean isComplete() {
    return complete;
  }

  public String isDue_By() {
    return due_by;
  }

  public Task(String description) {
    this.description = description;
    this.complete = false;
    this.due_by = "3000-01-01";
  }

  @Override
  public boolean equals(Object otherTask) {
    if(!(otherTask instanceof Task)) {
      return false;
    } else {
      Task newTask = (Task) otherTask;
      return this.getDescription().equals(newTask.getDescription()) &&
             this.getId() == newTask.getId() &&
             this.isComplete() == newTask.isComplete() &&
             this.isDue_By() == newTask.isDue_By();
    }
  }

  public static List<Task> all() {
    String sql = "SELECT id, description, complete, due_by FROM tasks ORDER BY COMPLETE ASC, DUE_BY ASC NULLS LAST";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Task.class);
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO tasks (description, complete, due_by) VALUES (:description, :complete, TO_DATE(:due_by, 'yyyy-mm-dd'))";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("description", this.description)
        .addParameter("complete", this.complete)
        .addParameter("due_by", this.due_by)
        .executeUpdate()
        .getKey();
    }
  }

  public static Task find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM tasks where id=:id";
      Task task = con.createQuery(sql)
          .addParameter("id", id)
          .executeAndFetchFirst(Task.class);
      return task;
    }
  }

  public void updateDescription(String description) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE tasks SET description = :description WHERE id = :id";
      con.createQuery(sql)
        .addParameter("description", description)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void completeIt() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE tasks SET complete = NOT complete WHERE id = :id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void updateDue_By(String due_by) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE tasks SET due_by = TO_DATE(:due_by, 'yyyy-mm-dd') WHERE id = :id";
      con.createQuery(sql)
        .addParameter("due_by", due_by)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String deleteQuery = "DELETE FROM tasks WHERE id = :id";
        con.createQuery(deleteQuery)
          .addParameter("id", id)
          .executeUpdate();

      String joinDeleteQuery = "DELETE FROM categories_tasks WHERE task_id = :task_id";
        con.createQuery(joinDeleteQuery)
          .addParameter("task_id", this.getId())
          .executeUpdate();
    }
  }

  public void addCategory(Category category) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO categories_tasks (category_id, task_id) VALUES (:category_id, :task_id)";
      con.createQuery(sql)
        .addParameter("category_id", category.getId())
        .addParameter("task_id", this.getId())
        .executeUpdate();
    }
  }

  public List<Category> getCategories() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT category_id FROM categories_tasks WHERE task_id = :task_id";
      List<Integer> categoryIds = con.createQuery(sql)
        .addParameter("task_id", this.getId())
        .executeAndFetch(Integer.class);

      ArrayList<Category> categories = new ArrayList<Category>();

      for (Integer categoryId : categoryIds) {
          String categoryQuery = "SELECT * FROM categories WHERE id = :categoryId";
          Category category = con.createQuery(categoryQuery)
            .addParameter("categoryId", categoryId)
            .executeAndFetchFirst(Category.class);
          categories.add(category);
      }
      return categories;
    }
  }

  public String getCategoryNames() {
    List<Category> categories = this.getCategories();
    String results = "|";
    for ( Category category : categories ) {
      String newCategory = category.getName();
      results += (" " + newCategory + " |");
    }
    return results;
  }


}
