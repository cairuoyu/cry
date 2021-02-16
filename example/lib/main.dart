import 'package:cry/common/application_context.dart';
import 'package:cry/cry_buttons.dart';
import 'package:cry/cry_data_table.dart';
import 'package:cry/cry_dialog.dart';
import 'package:cry/cry_image_upload.dart';
import 'package:cry/cry_button.dart';
import 'package:cry/cry_list_view.dart';
import 'package:cry/cry_menu.dart';
import 'package:cry/cry_tree_table.dart';
import 'package:cry/form/cry_checkbox.dart';
import 'package:cry/form/cry_input.dart';
import 'package:cry/form/cry_select.dart';
import 'package:cry/form/cry_select_custom_widget.dart';
import 'package:cry/form/cry_select_date.dart';
import 'package:cry/form1/cry_input.dart' as cryInput1;
import 'package:cry/form1/cry_select.dart' as crySelect1;
import 'package:cry/generated/l10n.dart';
import 'package:cry/model/order_item_model.dart';
import 'package:cry/model/page_model.dart';
import 'package:cry/model/request_body_api.dart';
import 'package:cry/model/response_body_api.dart';
import 'package:cry/model/test_tree_model.dart';
import 'package:cry/utils/http_util.dart';
import 'package:cry/utils/tree_util.dart';
import 'package:cry/vo/select_option_vo.dart';
import 'package:cry/vo/tree_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationContext.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cry Demo',
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('zh'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cry Demo Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DemoMenu(),
            DemoButton(),
            DemoImageUpload(),
            DemoForm(),
            DemoTreeTable(),
            DemoDataTable(),
            DemoListView(),
          ],
        ),
      ),
    );
  }
}

class DemoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var result = CryMenu(
      child: ListTile(
        title: Text('右键或长按'),
      ),
      onSelected: (v) {
        print(v);
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 'a',
          child: ListTile(
            title: Text('Close All'),
          ),
        ),
        PopupMenuItem(
          value: 'b',
          child: ListTile(
            title: Text('Close Others'),
          ),
        ),
      ],
      // child: tabContent,
    );
    return result;
  }
}

class DemoDataTable extends StatefulWidget {
  @override
  _DemoDataTableState createState() => _DemoDataTableState();
}

class _DemoDataTableState extends State<DemoDataTable> {
  PageModel page =
      PageModel(orders: [OrderItemModel(column: 'update_time')], size: 5);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    CryDataTable table = CryDataTable(
      title: 'User List',
      page: this.page,
      columns: [
        DataColumn(label: Text('name')),
        DataColumn(label: Text('createTime')),
      ],
      getCells: (Map m) {
        return [
          DataCell(Text(m['name'] ?? '--')),
          DataCell(Text(m['createTime'] ?? '--')),
        ];
      },
    );

    return table;
  }

  _loadData() async {
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/userInfo/page',
        data: RequestBodyApi(page: page).toMap());
    this.page = PageModel.fromMap(responseBodyApi.data);
    setState(() {});
  }
}

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = ButtonBar(
      children: [
        CryButton(
          iconData: Icons.save,
          label: 'testButton',
          onPressed: () {
            print('testButton');
          },
        ),
        CryButtons.query(context, () => print('test commonButton')),
        CryButtons.add(context, () => print('test commonButton')),
        CryButtons.save(context, () => print('test commonButton')),
        CryButtons.commit(context, () => print('test commonButton')),
        CryButtons.delete(context, () {
          cryConfirm(context, '确定？', (context) {
            Navigator.pop(context);
          });
        }),
      ],
    );
    return buttons;
  }
}

class DemoForm extends StatefulWidget {
  @override
  _DemoFormState createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testValue1 = '1';
  bool testValue2 = true;

  @override
  Widget build(BuildContext context) {
    var input = CryInput(
      label: 'testInput',
      value: testValue1,
      onSaved: (v) {
        this.testValue1 = v;
      },
    );
    var input1 = CryInput(label: 'testInput', width: 400);
    var input2 = cryInput1.CryInput(label: 'testInput1');
    var dateSelect = CrySelectDate(
      context,
      label: 'testSelectDate',
    );
    var select = CrySelect(
      label: 'testSelect',
      dataList: [
        SelectOptionVO(label: '1', value: 'a'),
        SelectOptionVO(label: '2', value: 'b'),
      ],
    );
    var select1 = crySelect1.CrySelect(
      label: 'testSelect1',
      dataList: [
        SelectOptionVO(label: '1', value: 'a'),
        SelectOptionVO(label: '2', value: 'b'),
      ],
    );
    var checkbox1 = CryCheckbox('checkboxTestLabel', this.testValue2, (v) {
      this.testValue2 = v;
    });
    var checkbox2 = CryCheckbox('checkboxTestLabel', false, (v) {});
    var reset = CryButtons.reset(context, () {
      this.testValue2 = true;
      setState(() {});
    });
    var save = CryButtons.save(context, () {
      print('save');
      formKey.currentState.save();
      print(testValue1);
      print(testValue2);
    });
    ButtonBar bb = ButtonBar(children: [reset, save]);
    var cw = CrySelectCustomWidget(
      context,
      onSaved: (v) {
        print('onSave');
        print(v);
      },
      popWidget: CryButtons.cancel(context, () {
        Navigator.pop(context, 'res');
      }),
      getValue: (v) {
        return 'res-value';
      },
      getValueLabel: (v) {
        return 'res-valueLabel';
      },
    );
    var form = Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cw,
          Divider(height: 20, color: Colors.amber),
          bb,
          input,
          input1,
          Wrap(children: [checkbox1, checkbox2]),
          checkbox1,
          checkbox2,
          select,
          dateSelect,
          Wrap(
            children: [
              input2,
              select1,
            ],
          ),
        ],
      ),
    );
    return form;
  }
}

class DemoImageUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUpload = CryImageUpload(
      updateAreaSize: 200,
      updateAreaDefault: Icon(Icons.person, size: 200),
      onUpload: (imageBytes) {
        print('onUpload');
      },
    );
    return imageUpload;
  }
}

class DemoTreeTable extends StatefulWidget {
  @override
  _DemoTreeTableState createState() => _DemoTreeTableState();
}

class _DemoTreeTableState extends State<DemoTreeTable> {
  var data = TreeUtil.toTreeVOList([
    TestTreeModel(id: '0', c1: 'c1-value0', c2: 'c2-value0'),
    TestTreeModel(id: '1', pid: '0', c1: 'c1-value1', c2: 'c2-value1'),
    TestTreeModel(id: '11', pid: '1', c1: 'c11-value11', c2: 'c2-value11'),
    TestTreeModel(id: '2', pid: '0', c1: 'c1-value2', c2: 'c2-value2'),
  ]);

  @override
  Widget build(BuildContext context) {
    List<CryTreeTableColumnData> columnData = [
      CryTreeTableColumnData('列1', (TestTreeModel v) => v.c1),
      CryTreeTableColumnData('列2', (TestTreeModel v) => v.c2),
    ];

    var treeTable = CryTreeTable(
      getRowOper: (v, parent) => [
        CryButton(
          iconData: Icons.delete,
          onPressed: () => print('test'),
        )
      ],
      columnData: columnData,
      data: data,
      onSelected: (TreeVO<TestTreeModel> v) {
        this.setState(() {});
      },
    );
    return treeTable;
  }
}

class DemoListView extends StatefulWidget {
  @override
  _DemoListViewState createState() => _DemoListViewState();
}

class _DemoListViewState extends State<DemoListView> {
  @override
  Widget build(BuildContext context) {
    var listView = CryListView(
      title: 'listViewDemo',
      count: 50,
      getCell: (index) {
        return ListTile(
          title: Text('test-' + index.toString()),
        );
      },
    );
    var result = Container(
      height: 500,
      child: listView,
    );
    return result;
  }
}
