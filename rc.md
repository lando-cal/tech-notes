

```python
import bs4
html = """
<html><table><tr><td>
<a><img id="foo" alt="id foo"/></a>
</td></tr></table></html>
"""
```


```python
soup = bs4.BeautifulSoup(html, 'html.parser')
type(soup)
print(soup.prettify())
```

    <html>
     <table>
      <tr>
       <td>
        <a>
         <img alt="id foo" id="foo"/>
        </a>
       </td>
      </tr>
     </table>
    </html>




```python
element = soup.find(id="foo")
print(f'element is type "{type(element)}" with id {id(element)}')
```

    element is type "<class 'bs4.element.Tag'>" with id 4530161032



```python
def findParentTr(element):
    """ recursively walk element tree until a tr is found
    element 'bs4.element.Tag' """
    print(f"\nentered function for element id: {id(element)}")
    if element.name == 'tr':
        print("parent is tr!")
        print(f'returning parent with id {id(element)}')
        print(type(element))
        return element
    print('element is not a tr')
    parent = element.findParent()
    if not parent:
        print("no parent found ")
        return None
    print('parent exists, going up')
    final_parent = findParentTr(parent)
    return(final_parent)

print(f'id of element is {id(element)}')
g = findParentTr(element)
print(f'g is type "{type(g)}" with id {id(g)}')

```

    id of element is 4530161032

    entered function for element id: 4530161032
    element is not a tr
    parent exists, going up

    entered function for element id: 4530162320
    element is not a tr
    parent exists, going up

    entered function for element id: 4530162376
    element is not a tr
    parent exists, going up

    entered function for element id: 4530163272
    parent is tr!
    returning parent with id 4530163272
    <class 'bs4.element.Tag'>
    g is type "<class 'bs4.element.Tag'>" with id 4530163272



```python

```
