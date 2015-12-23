nginx v1.8.x Cookbook
======================
TODO: Enter the cookbook description here.

e.g.
This cookbook installs nginx web server and configures the node based on templates defined in

../templates/default/

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.


#### packages
- `nginx` - the package will be detected and installed via an internal repository

#### dependencies
- `none`

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### nginx-package::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nginx-package']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### nginx-package::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `nginx-package` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx-package]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Narayanan