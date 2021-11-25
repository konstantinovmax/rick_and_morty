import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            PersonCacheImage(
              width: 180,
              height: 180,
              imageUrl: person.image,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: person.status == 'Alive' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  person.status,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: [
                if (person.type.isNotEmpty) ..._buildText('Type:', person.type),
                ..._buildText('Gender:', person.gender),
                ..._buildText(
                    'Number of episodes:', person.episode.length.toString()),
                ..._buildText('Species:', person.species),
                ..._buildText('Last known location:', person.location.name),
                ..._buildText('Origin:', person.origin.name),
                ..._buildText('Was created:', person.created.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(color: AppColors.greyColor),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 8,
      ),
    ];
  }
}
