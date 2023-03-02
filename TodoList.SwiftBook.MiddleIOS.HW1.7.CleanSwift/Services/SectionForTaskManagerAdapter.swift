//
//  SectionForTaskManagerAdapter.swift
//  TaskManager.HW4.SwiftBook.MiddleIOSDev
//
//  Created by Вадим Гамзаев on 01.03.2023.
//

protocol ISectionForTaskManagerAdapter {
	func getSections() -> [Section]
	func getTasksForSection(section: Section) -> [Task]
	func taskSectionAndIndex(task: Task) -> (section: Section, index: Int)?
	func getSectionIndex(section: Section) -> Int
	func getSection(forIndex index: Int) -> Section
	func getTasksListTitle() -> String
}

enum Section: CaseIterable {
	case completed
	case uncompleted
	
	var title: String {
		switch self {
		case .completed:
			return "Completed"
		case .uncompleted:
			return "Uncompleted"
		}
	}
}

final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	
	private let sections: [Section] = [.uncompleted, .completed]
	
	private let taskManagerResponse: TodoList.TasksResponse
	
	init(taskManagerResponse: TodoList.TasksResponse) {
		self.taskManagerResponse = taskManagerResponse
	}
	
	func getSections() -> [Section] {
		sections
	}
	
	func getSectionIndex(section: Section) -> Int {
		sections.firstIndex(of: section) ?? 0
	}
	
	func getSection(forIndex index: Int) -> Section {
		let i = min(index, sections.count - 1)
		return sections[i]
	}
	
	func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManagerResponse.completedTasks
		case .uncompleted:
			return taskManagerResponse.uncomletedTasks
		}
	}
	
	func taskSectionAndIndex(task: Task) -> (section: Section, index: Int)? {
		for section in sections {
			let index = getTasksForSection(section: section).firstIndex{ task === $0 }
			if index != nil {
				return (section, index!)
			}
		}
		return nil
	}
	
	func getTasksListTitle() -> String {
		"\(taskManagerResponse.login.name)'s ToDoList"
	}
	
}
