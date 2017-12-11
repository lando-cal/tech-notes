"Google LLC is an American multinational technology company that specializes in Internet-related services and products." - <https://en.wikipedia.org/wiki/Google>

# Links

- [Google App Script](https://developers.google.com/apps-script)
- [Extending Google Docs](https://developers.google.com/apps-script/guides/docs)
- [Document Service](https://developers.google.com/apps-script/reference/document)
- [Web Store Developer Dashboard](https://chrome.google.com/webstore/developer/dashboard)
- [Service Accounts](https://developers.google.com/identity/protocols/OAuth2ServiceAccount#creatinganaccount)
- [gspread](https://pypi.python.org/pypi/gspread) - Python module for interacting with google spreadsheets
- [API Explorer](https://developers.google.com/apis-explorer)

# Sheets

- Function list - <https://support.google.com/docs/table/25273?hl=en>

## Conditional Formatting

### Regex matching to color

Colorize rows with conditional formatting by using an expression like this:

```
=REGEXMATCH($E:$E, "some_regex")
```

This regex is not anchored, so there is no need to prepend or append `.*`

Cell references in this case are relative unless prepended by a `\$`. So, if you want to match the cell you are working on you would use `A1:A1`.

### Color every other row

```
=MOD(ROW(),2)
```

## Import an RSS feed

```
=IMPORTFEED("https://api.flickr.com/services/feeds/photos_public.gne", B2, TRUE, 10)
```

## Sum lines that match a string

This uses syntax similar to a glob search, but uses ~ instead of \

```
=COUNTIF(D:D,"3*")
```

## Automatically resolve the DOW from a date

```
=CHOOSE( weekday(A4), "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
```
