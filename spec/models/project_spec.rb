require 'rails_helper'

RSpec.describe Project do
  let(:project) { Project.new }
  let(:task) { Task.new }
  
  it 'consider a project with no tasks to be done' do
    expect(project.done?).to be_truthy
  end

  it 'knows that a project with an incomplete task is not done' do
    project.tasks << task

    puts task.frozen?
    expect(project).not_to be_done
  end
end
