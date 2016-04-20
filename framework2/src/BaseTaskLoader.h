/* 
 * File:   BaseTaskLoader.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 12. April 2016
 */

#ifndef BASETASKLOADER_H
#define BASETASKLOADER_H

#include <iostream>
#include <map>
#include <memory>
#include <string>

#include "Task.h"

class BaseTaskLoader {
public:
    /**
     * Destructor of class BaseTaskLoader.
     */
    virtual ~BaseTaskLoader();
    /**
     * Loads and runs all tasks defined in tasks config file.
     * @param tasks_config_file_path Path to tasks config file.
     */
    virtual void createAllTasks(std::string tasks_config_file_path) = 0;
    /**
     * Processes config file and creates new task entries in m_tasks containter (stores info from config file).
     * @param tasks_config_file_path Path to tasks config file.
     */
    virtual void processTasksConfigFileAndStoreInfo(std::string tasks_config_file_path) = 0;
    /**
     * Reads again tasks config file and loads tasks with new ids.
     */
    virtual void reloadTasksConfigFileAndFindNewTasks() = 0;
    /**
     * Finds task in m_tasks and returns shared pointer to it.
     * @param task_id ID of a task.
     * @return Shared pointer to task.
     */
    std::shared_ptr<Task> findTask(unsigned int task_id);
    /**
     * Returns pointer to singleton instance.
     * @return Singleton pointer.
     */
    static std::shared_ptr<BaseTaskLoader> getInstance();
    
protected:
    /** 
     * Constructor of class BaseTaskLoader.
     */
    BaseTaskLoader();
    /**
     * Delete copy constructor.
     */
    BaseTaskLoader(const BaseTaskLoader& orig) = delete;
    /**
     * Delete assignment operator.
     */
    void operator=(const BaseTaskLoader&) = delete;
    /**
     * Path to tasks config file.
     */
    std::string m_tasks_config_file_path;
    /**
     * Singleton instance pointer.
     */
    static std::shared_ptr<BaseTaskLoader> m_instance;
    /**
     * Container storing all loaded tasks.
     */
    std::map<unsigned int /* ID of task */, std::shared_ptr<Task>> m_tasks;
};

#endif /* BASETASKLOADER_H */
