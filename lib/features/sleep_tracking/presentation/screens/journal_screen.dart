// lib/features/journal/presentation/screens/journal_screen.dart
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/repositories/journal_repository.dart';

final journalEntriesProvider = StreamProvider<List<JournalEntryModel>>((ref) {
  return JournalRepository().watchEntries();
});

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  void _openAddEntry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _AddJournalEntrySheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entriesAsync = ref.watch(journalEntriesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddEntry(context),
        backgroundColor: AppColors.indigo,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Entry',
          style: GoogleFonts.outfit(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                'Sleep Journal',
                style: GoogleFonts.outfit(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Track your mood, dreams & energy',
                style: GoogleFonts.outfit(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: entriesAsync.when(
                data: (entries) => entries.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const BouncingScrollPhysics(),
                        itemCount: entries.length,
                        itemBuilder: (_, i) => _buildEntryCard(entries[i], i),
                      ),
                loading: () => Center(
                  child: CircularProgressIndicator(color: AppColors.indigo),
                ),
                error: (e, _) => Center(
                  child: Text('Error',
                      style:
                          GoogleFonts.outfit(color: AppColors.textSecondary)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.book_outlined,
              size: 64, color: AppColors.indigo.withOpacity(0.4)),
          const SizedBox(height: 16),
          Text(
            'No journal entries yet',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start logging your sleep experience',
            style: GoogleFonts.outfit(
                color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildEntryCard(JournalEntryModel entry, int index) {
    final stressColor = entry.stressLevel <= 2
        ? AppColors.mint
        : entry.stressLevel == 3
            ? AppColors.amber
            : AppColors.rose;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                entry.mood,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, MMM d').format(entry.createdAt),
                      style: GoogleFonts.outfit(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      DateFormat('h:mm a').format(entry.createdAt),
                      style: GoogleFonts.outfit(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              _buildLevelBadge('Stress', entry.stressLevel, stressColor),
            ],
          ),
          if (entry.generalNotes != null && entry.generalNotes!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              entry.generalNotes!,
              style: GoogleFonts.outfit(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (entry.dreamNotes != null && entry.dreamNotes!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.cloud_outlined, size: 14, color: AppColors.purple),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    entry.dreamNotes!,
                    style: GoogleFonts.outfit(
                      color: AppColors.purple.withOpacity(0.8),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              _buildEnergyBar(entry.energyLevel),
              const Spacer(),
              GestureDetector(
                onTap: () => JournalRepository().deleteEntry(entry.id),
                child: Icon(Icons.delete_outline,
                    size: 18, color: AppColors.textMuted),
              ),
            ],
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: index * 60))
        .fadeIn(duration: 350.ms)
        .slideY(begin: 0.05, end: 0);
  }

  Widget _buildLevelBadge(String label, int level, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        '$label $level/5',
        style: GoogleFonts.outfit(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildEnergyBar(int level) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Energy: ',
          style: GoogleFonts.outfit(color: AppColors.textMuted, fontSize: 11),
        ),
        ...List.generate(
          5,
          (i) => Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(
              Icons.bolt,
              size: 14,
              color: i < level ? AppColors.amber : AppColors.surfaceLight,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddJournalEntrySheet extends ConsumerStatefulWidget {
  const _AddJournalEntrySheet();

  @override
  ConsumerState<_AddJournalEntrySheet> createState() =>
      _AddJournalEntrySheetState();
}

class _AddJournalEntrySheetState extends ConsumerState<_AddJournalEntrySheet> {
  String _selectedMood = AppConstants.moodOptions[2];
  int _stressLevel = 3;
  int _energyLevel = 3;
  final _notesController = TextEditingController();
  final _dreamController = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _notesController.dispose();
    _dreamController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final companion = JournalEntriesCompanion(
      mood: Value(_selectedMood),
      stressLevel: Value(_stressLevel),
      energyLevel: Value(_energyLevel),
      generalNotes: _notesController.text.trim().isEmpty
          ? const Value.absent()
          : Value(_notesController.text.trim()),
      dreamNotes: _dreamController.text.trim().isEmpty
          ? const Value.absent()
          : Value(_dreamController.text.trim()),
    );

    await JournalRepository().saveEntry(companion);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: EdgeInsets.fromLTRB(
          24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'New Journal Entry',
              style: GoogleFonts.outfit(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Text('How are you feeling?',
                style: GoogleFonts.outfit(
                    color: AppColors.textSecondary, fontSize: 13)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AppConstants.moodOptions.map((mood) {
                final selected = mood == _selectedMood;
                return GestureDetector(
                  onTap: () => setState(() => _selectedMood = mood),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          selected ? AppColors.indigo : AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected
                            ? AppColors.indigoLight
                            : Colors.transparent,
                      ),
                    ),
                    child: Text(
                      mood,
                      style: GoogleFonts.outfit(
                        color:
                            selected ? Colors.white : AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            _buildSliderRow('Stress Level', _stressLevel, AppColors.rose,
                (val) {
              setState(() => _stressLevel = val);
            }),
            const SizedBox(height: 12),
            _buildSliderRow('Energy Level', _energyLevel, AppColors.amber,
                (val) {
              setState(() => _energyLevel = val);
            }),
            const SizedBox(height: 20),
            TextField(
              controller: _notesController,
              style: GoogleFonts.outfit(color: AppColors.textPrimary),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Notes about your sleep...',
                filled: true,
                fillColor: AppColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                hintStyle: GoogleFonts.outfit(color: AppColors.textMuted),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _dreamController,
              style: GoogleFonts.outfit(color: AppColors.textPrimary),
              maxLines: 2,
              decoration: InputDecoration(
                hintText: '🌙 Dream notes (optional)...',
                filled: true,
                fillColor: AppColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                hintStyle: GoogleFonts.outfit(color: AppColors.textMuted),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: _saving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Save Entry',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderRow(
      String label, int value, Color color, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: GoogleFonts.outfit(
                    color: AppColors.textSecondary, fontSize: 13)),
            Text(
              '$value / 5',
              style: GoogleFonts.outfit(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: AppColors.surfaceLight,
            thumbColor: color,
            overlayColor: color.withOpacity(0.2),
            trackHeight: 4,
          ),
          child: Slider(
            value: value.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
      ],
    );
  }
}
