package dailytasks.dao;

import org.springframework.data.repository.CrudRepository;

import dailytasks.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

}
