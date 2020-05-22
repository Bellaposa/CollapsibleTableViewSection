# CollapsibleTableViewSection

This is an example with CollapsibleTableViewSection.

Use: 
- Define your custom type in `CollapsibleSectionItemType` enum

- In CollapsibleSection you can populate `items` with your custom Type

- Declare your custom SectionType by conforming to protocol `CollapsibleSectionItem`
  - All custom SectionType will have:
    - type
    - sectionTitle
    - rowCount
    - isCollapsible
    - isCollapsed


- In `tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)` define your custom `UITableViewCell`
- In `tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)` define your custom `HeaderFooterView`

- Extend your class `CollapsibleSection` with `HeaderViewDelegate` for toggleSection in Header

- Register your Custom Cell 
- Register your Custom Header
