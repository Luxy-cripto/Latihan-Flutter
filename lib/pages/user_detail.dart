import 'package:flutter/material.dart';

import '../models/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil pengguna')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ProfileHeader(user: user),
            const SizedBox(height: 16),
            _DetailSection(
              title: 'Informasi kontak',
              icon: Icons.contact_mail_outlined,
              children: [
                _DetailTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: user.email,
                ),
                _DetailTile(
                  icon: Icons.phone_outlined,
                  label: 'Telepon',
                  value: user.phone,
                ),
                _DetailTile(
                  icon: Icons.language_outlined,
                  label: 'Website',
                  value: user.website,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _DetailSection(
              title: 'Alamat',
              icon: Icons.location_on_outlined,
              children: [
                _DetailTile(
                  icon: Icons.home_outlined,
                  label: 'Alamat jalan',
                  value: '${user.address.street}, ${user.address.suite}',
                ),
                _DetailTile(
                  icon: Icons.location_city_outlined,
                  label: 'Kota',
                  value: user.address.city,
                ),
                _DetailTile(
                  icon: Icons.markunread_mailbox_outlined,
                  label: 'Kode pos',
                  value: user.address.zipcode,
                ),
                _DetailTile(
                  icon: Icons.my_location_outlined,
                  label: 'Koordinat',
                  value: '${user.address.geo.lat}, ${user.address.geo.lng}',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _DetailSection(
              title: 'Perusahaan',
              icon: Icons.business_outlined,
              children: [
                _DetailTile(
                  icon: Icons.apartment_outlined,
                  label: 'Nama perusahaan',
                  value: user.company.name,
                ),
                _DetailTile(
                  icon: Icons.format_quote_outlined,
                  label: 'Slogan',
                  value: user.company.catchPhrase,
                ),
                _DetailTile(
                  icon: Icons.work_outline,
                  label: 'Bidang usaha',
                  value: user.company.bs,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'ID pengguna: ${user.id}',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;

  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: colors.primaryContainer,
              child: Text(
                _initials(user.name),
                style: textTheme.headlineSmall?.copyWith(
                  color: colors.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              user.name,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '@${user.username}',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    size: 16,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 7),
                  Flexible(
                    child: Text(
                      user.company.name,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return '${parts.first.characters.first}${parts.last.characters.first}'
        .toUpperCase();
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _DetailSection({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colors.primary, size: 21),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.onSurfaceVariant),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 3),
                SelectableText(value, style: textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
