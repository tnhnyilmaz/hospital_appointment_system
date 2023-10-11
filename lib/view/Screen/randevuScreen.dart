import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';
import 'package:flutter_application_2/view/compenent/bottomAppBar.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/randevuCard.dart';

import '../../Services/RandevuService.dart';
import '../../model/randevuModel/RandevuModel.dart';

class RandevuScreen extends StatefulWidget {
  const RandevuScreen({super.key});

  @override
  State<RandevuScreen> createState() => _RandevuScreenState();
}

class _RandevuScreenState extends State<RandevuScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RandevuService service;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    service = RandevuService();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: ProjectColors.backgroundGrey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Randevularım",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 35),
                  ),
                ),
                flex: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: ProjectColors.green,
                tabs: [
                  Tab(
                    child: Text(
                      "Randevularım",
                      style: TextStyle(
                          color: _tabController.index == 0
                              ? Colors.green
                              : Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Geçmiş\nRandevularım",
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Colors.green
                              : Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: buildFetchRandevuInfo(),
                flex: 8,
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomTabBar(),
      ),
    );
  }

  FutureBuilder<List<RandevuModel>> buildFetchRandevuInfo() {
    return FutureBuilder<List<RandevuModel>>(
      future: service.fetchRandevu(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Veri yüklenirken bir hata oluştu: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Text('Veri bulunamadı.');
        } else {
          List<RandevuModel> randevular = snapshot.data!;
          print("randevular ${randevular}");

          final randevularim =
              randevular.where((randevu) => randevu.randevuState).toList();
          final gecmisRandevularim =
              randevular.where((randevu) => !randevu.randevuState).toList();

          final List<RandevuModel> goruntulenecekRandevular =
              _tabController.index == 0 ? randevularim : gecmisRandevularim;

          return ListView.builder(
            itemCount: goruntulenecekRandevular.length,
            itemBuilder: (context, index) {
              final randevu = goruntulenecekRandevular[index];
              return RandevuCard(
                containerColor:
                    randevu.randevuState ? Colors.green : Colors.red,
                textPoliklinik: randevu.randevuPoliklinik,
                textPoliklinikYer: randevu.randevuPoliklinikYer,
                textKullanici: randevu.randevuKullanici,
                textHastane: randevu.randevuHastane,
                randevuTur: randevu.randevuTur,
                randevuDurumu:
                    _tabController.index == 0 ? "Randevularım" : "Geçmiş",
              );
            },
          );
        }
      },
    );
  }
}
