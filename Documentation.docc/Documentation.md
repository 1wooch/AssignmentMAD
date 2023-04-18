# ``AssignmentMAD``

This project is about listing all of the task and task detail on Swift View.

## Overview


    Our project has mainly 3 views
    # ``MileStone1View`` 
    - This is the first view that user face in this app.
    - Contain Main title that can be edit in ``EditView``
    - Contain list that showing all of the array value, and user can go to task detail by clicking value and it will led to ``subContentView``
    - User can enter ``EditView`` by clicking 'edit' button.
    - '+' button will add new element in list and also will be in array.

    #``subContentView``
    - This will display detail of task list.
    - The name of task will display top of the view
    - Contain list that showing all of the array value, and user can go to task detail by clicking value and it will led to ``subContentExtractedView``
    - User can enter ``EditView2`` by clicking 'edit' button.
    - '+' button will add new element in list and also will be in array.
    - In edit mode user can move, delete and change the name of task.
    - User can delete list value by dragging to left.
    
    #``subContentExtractedView``
    - This view will only display the detail of detail of task list value.
    - User can edit view  by clicking 'edit' button and enter new name for value and click 'Done'.


## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->
    #Model
    - ``SwiftUIView``
    # View
- ``LoadingView``
     - ``MileStone1View`` (ContentView)
        - ``EditView`` (EditView)
        - ``subContentView`` (subContent)
            - ``EditView2`` (EditView)
            - ``subContentExtractedView`` (subContent)
                - ``subConDetailView`` (subContent)

## Testing

- ``testArrayValue``
    - put value in Array ``checkListDetailitem``
    - check the value is matching with input value
    - change the value by using toggle 
    - Check whether the value has changed and match
- ``testArrayTypeCHECK``
    - make value that has ``checkListDetailitem``
    - check the ``checkListDetailitem.check`` type = Bool
- ``testArrayTypeNAME``
    - make value that has ``checkListDetailitem``
    - check the ``checkListDetailitem.name`` type =Str
- ``testArrayTypeCKLNAME``
    - make value that has ``checkList``
    - check the ``checkList.name`` type = Str
- ``testArrayTypeCKLArray``
    - make value that has ``checkList``
    - check the ``checkList.checkListDetail`` type = Array<checkListDetailitem>
