// Realistic-ish widgets: real trees, forms, animations, long lists.
// Nothing here is artificially slow; it is just not Card(Text).
import 'package:flutter/material.dart';

class RichForm extends StatefulWidget {
  const RichForm({super.key, this.onSubmit});
  final ValueChanged<Map<String, String>>? onSubmit;
  @override
  State<RichForm> createState() => _RichFormState();
}

class _RichFormState extends State<RichForm> {
  final _key = GlobalKey<FormState>();
  final _values = <String, String>{};
  bool _busy = false;

  static const fields = ['name', 'email', 'street', 'city', 'postcode', 'notes'];

  Future<void> _submit() async {
    if (!_key.currentState!.validate()) return;
    setState(() => _busy = true);
    _key.currentState!.save();
    await Future<void>.delayed(Duration.zero);
    if (!mounted) return;
    setState(() => _busy = false);
    widget.onSubmit?.call(Map.of(_values));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final f in fields)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextFormField(
                key: Key('field_$f'),
                decoration: InputDecoration(labelText: f, border: const OutlineInputBorder()),
                validator: (v) => (v == null || v.isEmpty) ? '$f is required' : null,
                onSaved: (v) => _values[f] = v ?? '',
              ),
            ),
          const SizedBox(height: 8),
          _busy
              ? const CircularProgressIndicator()
              : FilledButton(key: const Key('submit'), onPressed: _submit, child: const Text(context.l10n.submit)),
        ],
      ),
    );
  }
}

class RichList extends StatelessWidget {
  const RichList({super.key, this.count = 300});
  final int count;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, i) => ListTile(
        key: Key('row_$i'),
        leading: CircleAvatar(child: Text('$i')),
        title: Text('Item $i'),
        subtitle: Text('subtitle for item $i'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class RichTabs extends StatelessWidget {
  const RichTabs({super.key});
  static const tabs = ['one', 'two', 'three', 'four'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(tabs: [for (final t in tabs) Tab(key: Key('tab_$t'), text: t)]),
          Expanded(
            child: TabBarView(
              children: [for (final t in tabs) Center(key: Key('page_$t'), child: Text('page $t'))],
            ),
          ),
        ],
      ),
    );
  }
}

class RichReveal extends StatefulWidget {
  const RichReveal({super.key});
  @override
  State<RichReveal> createState() => _RichRevealState();
}

class _RichRevealState extends State<RichReveal> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(
          key: const Key('toggle'),
          onPressed: () => setState(() => _open = !_open),
          child: const Text('toggle'),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: _open ? 120 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _open ? 1 : 0,
            child: const Center(key: Key('panel'), child: Text('revealed')),
          ),
        ),
      ],
    );
  }
}
