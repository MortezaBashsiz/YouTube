# Some useful Ansible inventory flags for beautify and visualization

## List all inventory and hosts variable ad attributes in `json` format

```
ansible-inventory --list -i inventory/main.yml
```

```json
{
    "_meta": {
        "hostvars": {
            "app1.sudoer.net": {
                "LISTVAR": [
                    "app1_list1",
                    "app1_list2",
                    "app1_list3"
                ],
                "VARIABLE": "APP1 HOST VARS"
            },
            "app2.sudoer.net": {
                "LISTVAR": [
                    "app2_list1",
                    "app2_list2",
                    "app2_list3"
                ],
                "VARIABLE": "APP2 HOST VARS"
            },
            "db.sudoer.net": {
                "LISTVAR": [
                    "db_list1",
                    "db_list2",
                    "db_list3"
                ],
                "VARIABLE": "DB HOST VARS"
            },
            "lb.sudoer.net": {
                "LISTVAR": [
                    "lb_list1",
                    "lb_list2",
                    "lb_list3"
                ],
                "VARIABLE": "LB HOST VARS"
            }
        }
    },
    "all": {
        "children": [
            "app",
            "db",
            "lb",
            "ungrouped"
        ]
    },
    "app": {
        "hosts": [
            "app1.sudoer.net",
            "app2.sudoer.net"
        ]
    },
    "db": {
        "hosts": [
            "db.sudoer.net"
        ]
    },
    "lb": {
        "hosts": [
            "lb.sudoer.net"
        ]
    }
}

```

## List all inventory and hosts variable ad attributes in `yaml` format
   
```
ansible-inventory --list -i inventory/main.yml --yaml
```

```yaml
all:
  children:
    app:
      hosts:
        app1.sudoer.net:
          LISTVAR:
          - app1_list1
          - app1_list2
          - app1_list3
          VARIABLE: APP1 HOST VARS
        app2.sudoer.net:
          LISTVAR:
          - app2_list1
          - app2_list2
          - app2_list3
          VARIABLE: APP2 HOST VARS
    db:
      hosts:
        db.sudoer.net:
          LISTVAR:
          - db_list1
          - db_list2
          - db_list3
          VARIABLE: DB HOST VARS
    lb:
      hosts:
        lb.sudoer.net:
          LISTVAR:
          - lb_list1
          - lb_list2
          - lb_list3
          VARIABLE: LB HOST VARS
    ungrouped: {}

```

## Show Inventory in Graph 

```
ansible-inventory -i inventory/main.yml --graph 
```

```
@all:
  |--@app:
  |  |--app1.sudoer.net
  |  |--app2.sudoer.net
  |--@db:
  |  |--db.sudoer.net
  |--@lb:
  |  |--lb.sudoer.net
  |--@ungrouped:
```

## Show a specific host attributes and variables

```
ansible-inventory -i inventory/main.yml --host db.sudoer.net
```

```json
{
    "LISTVAR": [
        "db_list1",
        "db_list2",
        "db_list3"
    ],
    "VARIABLE": "DB HOST VARS"
}
```
