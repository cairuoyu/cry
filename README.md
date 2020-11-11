# cry
一个Flutter组件包，包含button、form、dataTable、dialog、imageUpload、root、toggleButton、transfer、treeTable

## 安装
```yaml
dependencies:
  cry: <latest_version>
```

## 用例
```dart
class DemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = CryButton(
      iconData: Icons.save,
      label: 'testButton',
      onPressed: () {
        print('testButton');
      },
    );
    return button;
  }
}
```

## live demo
http://www.cairuoyu.com/flutter_admin



