import 'package:flutter/material.dart';
import 'package:latihan_1/routes/app_routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A), // Slate 900
              Color(0xFF1E293B), // Slate 800
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final contentWidth =
                  (constraints.maxWidth - 32).clamp(0.0, 500.0).toDouble();
              final tileSize = (contentWidth - 14) / 2;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Center(
                  child: SizedBox(
                    width: contentWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        // Header Banner Santai
                        _buildFunHeader(),
                        const SizedBox(height: 24),

                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            'Pilih Modul 🎯',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Grid Cards Modern
                        Wrap(
                          spacing: 14,
                          runSpacing: 14,
                          children: [
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.grid_view_rounded,
                              label: 'Latihan Grid',
                              subtitle: 'Layout & Responsif',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.latihanGrid,
                              )
                            ),
                             
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.home_rounded,
                              label: 'Home',
                              subtitle: 'Kembali ke Beranda',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6B7280), Color(0xFF374151)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.home,
                              ),
                            ),

                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.shopping_bag_rounded,
                              label: 'Toko Elektronik',
                              subtitle: 'Katalog & Cart',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF059669)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.tokoElektronik,
                              ),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.photo_library_rounded,
                              label: 'Album Page',
                              subtitle: 'Galeri Media',
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.albumPage,
                              ),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.edit_note_rounded,
                              label: 'Input Form',
                              subtitle: 'Formulir Data',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.inputForm,
                              ),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.touch_app_rounded,
                              label: 'Klik Saya',
                              subtitle: 'Event Handler',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF14B8A6), Color(0xFF0D9488)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.formulir,
                              ),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.block_rounded,
                              label: 'Nonaktif',
                              subtitle: 'Disabled Button',
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade900,
                                  Colors.grey.shade800
                                ],
                              ),
                              isDisabled: true,
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.palette_rounded,
                              label: 'Tombol Biru',
                              subtitle: 'Style Preset',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
                              ),
                              onTap: () {},
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.sentiment_very_satisfied_rounded,
                              label: 'Tombol Bulat',
                              subtitle: 'Rounded Action',
                              gradient: const LinearGradient(
                                colors: [Color(0xFFA855F7), Color(0xFF7E22CE)],
                              ),
                              onTap: () {},
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.person_search_rounded,
                              label: 'Edit Profil',
                              subtitle: 'Pengaturan User',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF64748B), Color(0xFF475569)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.userPage,
                              ),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.cancel_rounded,
                              label: 'Batal',
                              subtitle: 'Reset Choice',
                              gradient: const LinearGradient(
                                colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                              ),
                              onTap: () => debugPrint('TextButton ditekan'),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.share_rounded,
                              label: 'Bagikan',
                              subtitle: 'Share Content',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF06B6D4), Color(0xFF0891B2)],
                              ),
                              onTap: () => debugPrint('Tombol share ditekan'),
                            ),
                            _buildPlayfulTile(
                              size: tileSize,
                              icon: Icons.phone_iphone_rounded,
                              label: 'iOS Style',
                              subtitle: 'Cupertino Vibe',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF334155), Color(0xFF1E293B)],
                              ),
                              onTap: () {},
                            ),
                            _buildFunHeader(
                              // Tombol tambahan untuk navigasi ke halaman PostPage
                              size: tileSize,
                              icon: Icons.article_rounded,
                              label: 'Post Page',
                              subtitle: 'Fetch & Display Posts',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.postPage,
                              ),
                            ),
                            _buildFunHeader(
                              // Tombol tambahan untuk navigasi ke halaman UserPage
                              size: tileSize,
                              icon: Icons.person_rounded,
                              label: 'User Page',
                              subtitle: 'Fetch & Display Users',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF059669)],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.userPage,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFunHeader({
    double? size,
    IconData? icon,
    String label = 'Lab Tugas & Sandbox 🚀',
    String subtitle =
        'Kumpulan eksperimen widget & halaman latihan Flutter. Tinggal klik buat nyobain!',
    LinearGradient? gradient,
    VoidCallback? onTap,
  }) {
    if (size != null && icon != null) {
      final activeGradient = gradient ??
          const LinearGradient(
            colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
          );

      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: activeGradient,
          boxShadow: [
            BoxShadow(
              color: activeGradient.colors.first.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            splashColor: Colors.white.withOpacity(0.2),
            highlightColor: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      icon,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayfulTile({
    required double size,
    required IconData icon,
    required String label,
    required String subtitle,
    required LinearGradient gradient,
    bool isDisabled = false,
    VoidCallback? onTap,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: isDisabled
            ? LinearGradient(
                colors: [Colors.grey.shade900, Colors.grey.shade800],
              )
            : gradient,
        boxShadow: isDisabled
            ? []
            : [
                BoxShadow(
                  color: gradient.colors.first.withOpacity(0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icon,
                    size: 26,
                    color: isDisabled ? Colors.white38 : Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isDisabled ? Colors.white38 : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isDisabled ? Colors.white24 : Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}