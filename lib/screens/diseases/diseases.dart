import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/diseases/Plantdiseases.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar( leading:
      IconButton(
        icon:Icon(Icons.arrow_back_ios,
           size: 25,
           color:  Color.fromARGB(255, 5, 77, 59),
           weight:300, ),
           onPressed: () {
        Navigator.pop(context); // Navigate back
      },
        ),
    actions: [
      Image.asset('assets/logo1.png'),
    ],
      ),
      body: Stack(
        children: [
          BackgroundColor(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('Diseases', style: TextStyle(fontSize: 30,
                 fontWeight: FontWeight.bold,
                 color: Color.fromARGB(255, 5, 77, 59),
                 ),
                  ),
                SizedBox(height: 30,),
                 Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              buildImageContainer(context, 'assets/plants dise/1.png', 'Bacteria soft rot',
                                   "Bacterial soft rot affects the entire plant. It shows up as water-soaked spots on leaves. In time, the spots start merging, and as the disease progresses, the plant starts to fall over. This disease usually appears if the plant crown is exposed to water over long periods. To prevent bacterial soft rot, don't water the plant too often or from overhead.",),
                              buildImageContainer(context, 'assets/plants dise/2.jpg', 'Anthracnose ',
                      'Anthracnose is a fungal disease thatcommonly occurs during summer heat. Atfirst, you may observe round or oval brown.spots, which develop into larger, irregular shapes. Finally, the leaves wither and fall off.When the disease occurs, remove infected leaves promptly and spray with a fungicide',),
                              buildImageContainer(context, 'assets/plants dise/3.jpg', 'Aphids',
                      'Aphids are a main pest of golden pothos and have greater impact on indoor plants. Aphids stab and suck the juice from new branches and leaves, harming its growth. If the disease is not serious, remove aphids by flushing the leaves with plant ash. If there are a large number of aphids, spray with aphid killers.',),
            ],
                              
                            ),
                            SizedBox(height: 10,),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              buildImageContainer(context, 'assets/plants dise/4.jpg', 'Mealybugs',
    'If there are white-pink and sticky substances on the plants stem or leaf back, it may be infected with mealy bugs. They feed on plant sap in groups, causing plants to grow slowly and produce flocculent and sticky substances that affect the plant appearance. The infected leaves or plants can be washed with a highpressure water flow or wiped directly with a cotton swab with alcohol. In case of severe infection, the insecticide containing pyrethrins can be sprayed directly.',),
                              buildImageContainer(context, 'assets/plants dise/5.jpg', 'Spider Mites',
                      'Red spider mites usually affect indoor plants. Indications of them included yellow spots on the leaves and webbing across the plant.Because they suck the sap of the plant, they can dry the plant out and cause it to die. As soon as you notice symptoms, wash the leaves every day in lukewarm water, perhaps with insecticidal soap, until you no longer see the yellow spots.',),
                              buildImageContainer(context, 'assets/plants dise/6.png', 'Scale insects',
                      'Scale insects are common pests of snake plant. Their body is covered with a shell and they produce waxy secretions. They usually cling to the leaves to suck the sap from the plants and can damage or even kill the leaves. Scale insects can be wiped off the leaves using a soft cloth or sprayed with pesticides.',),
            ],
                              
                            ),
                              SizedBox(height: 10,),
                                Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              buildImageContainer(context, 'assets/plants dise/7.jpg', 'pests and Diseases',
                      '1-In high temperature and humid environment,bacteria are easy to grow in the soil, whichwill make the succulent plant infected withfatal black rot, sooty mold, powdery mildew,etc. Therefore, it is recommended to sterilizethe succulent plant one month beforesummer. Generally, carbendazim mixed with water in the proportion of 1:1000 is selectedand evenly sprayed on ground parts ofsucculent plants, such as leaves and stems.2-The underground part can be treated by rootfilling method. You can submerge theflowerpot planted with succulent plant insterilization liquid and wait for the soil toslowly absorb the liquid. It is recommended toapply carbendazim once two weeks, totallytwice. For succulent planted in the garden, it easy to spray sterilization liquid directly or usea small amount of sterilization liquid to irrigate the soil.',),
                              buildImageContainer(context, 'assets/plants dise/8.png', 'Grey spot',
                      'Grey spot attacks branches, forming spindlyulcers or irregular depressions. The xylem(the tissue in plants that conducts water andnutrients) turns black. Since most pathogensinvade wounds, protect the wound whenpruning. Grey spot increases in heat andhumidity, so protect the plant from those states and ensure good ventilation. Apply fungicide to the affected parts.',),
                              buildImageContainer(context, 'assets/plants dise/9.png', 'Powdery mildew',
                      'Powdery mildew usually occurs if it is warm and wet during the late spring or early summer. Infected plants have powdery white spots on the leaves and stems. Lower leaves are affected the most, but powdery mildew can appear on any above-ground part of a plant. Infected leaves and stems should be removed once found, and ventilation around the plant should be improved to reduce the humidity. Fungicides can be used to control powdery mildew.',),
            ],
                              
                            ),
                            SizedBox(height: 10,),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              buildImageContainer(context, 'assets/plants dise/10.jpg', 'Leaf spot',
                      'Leaf spot is caused by a fungus called Alternaria. It usually occurs in warm and wetweather during late spring and early summer. Alternaria leaf spot always begins with the appearance of small brown spots, surrounded by a faded yellow color. As the disease progresses, the spots can grow into larger spots with irregular edges. Infected leaves. should be removed once found, and ventilation around the plant should be improved to reduce the humidity. Fungicides can be used to control leaf spot. This should involve a first application of fungicide followed by a second application a week later, to avoid recrudescence.',),
                              buildImageContainer(context, 'assets/plants dise/11.jpg', 'Downy Mildew',
                      'Downy Mildew Most commonly occurring when coleus is in a greenhouse, downy mildew will cause the leaves of your plant to droop and curl. If you catch this disease early, by noticing black spots on leaves, remove the infected areas immediately. If the problem continues, you may need to dispose of the plant to stop it from spreading to others. You can prevent downy mildew by proper watering and ventilating.',),
                              buildImageContainer(context, 'assets/plants dise/12.jpg', 'Leaf blight',
                      'Leaf blight mostly originates from infection to leaf margins and tips. The diseased spots are small or large, with an irregular shape, and range from reddish brown to grayish brown. The diseased spots are spread into large withered spots, with this usually occurring in the summer and autumn. The inchplant can be infected during times of weak growth, and in its normal growing period. High temperature and humidity, as well as poor ventilation, are all conducive to the outbreak of this disease. Strengthening water and fertilizer management, while paying attention to nutrition balance, during planting are good methods to effectively prevent leaf blight. In the fall, the diseased leaves should be completely removed and burned down in order to reduce the source of infection the following year. The planting area should have good drainage and fertile soil. Organic fertilizers, along with phosphorus and potassium fertilizers, should be added.',)
            ],
                              
                            ),
                            SizedBox(height: 10,),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              buildImageContainer(context, 'assets/plants dise/13.jpg', 'Sooty mold ',
                      'Sooty mold is commonly seen on flowers and trees, affecting photosynthesis, reducing ornamental value and economic value, and even causing death. Symptoms are small black mildew spots that form on the leaf surface and the branch tip. The spots expand over time, and soon connect, so that the whole leaf surface, along with the tender tip, are covered with black mildew layers. It mostly breaks out in the summer, becoming especially severe in high temperatures and humidity. Aphids, scale insects and other pests should be prevented to lower the chances of sooty mold developing. Keeping the planting area ventilated and transparent can also reduce the incidence of disease. If sooty mold occurs, fungicides can be sprayed onto the plant.',),
                              buildImageContainer(context, 'assets/plants dise/14.jpg', 'Argid sawflies',
                      'Argid sawflies are common pests . Their larvae eat leaves in groups. Inserious cases, they will eat up the mesophyll and tender shoots, leaving only thick veins. If you find this pest, the cocoon in the soil near the affected plant can be dug out in winter and spring to eliminate the pest at the source. During a larval infestation, spray with pesticide or kill them manually before they disperse or completely hatch ',),
                              buildImageContainer(context, 'assets/plants dise/15.jpg', 'Black Spot',
                      'Black spot is a common plant disease that occurs worldwide. It mainly damages leaves, then petioles, leaf tips, young shoots, and pedicels. The disease forms spots on the leaves that are purple-brown to brown dots at first, then rapidly expand into round spots in the later stages. The leaves turn yellow in large areas and fall off early. When the disease is serious, all the leaves can fall, delivering the plant a devastating blow that seriously affects its growth. Fungicides can control black spot in the early stages, but this disease is difficult to cure. As a result, the main focus is on prevention during daily care. The infected leaves should be removed quickly to reduce the source of the disease, and any fallen leaves should be cleaned away. In winter, severely infected plants should be heavily pruned to remove the pathogens.'),
            ],
                              
                            ),
                          ],
                        ),

          )
        ],
      ),
    );
  }
  Widget buildImageContainer(BuildContext context, String imagePath, String label,String description) {
    return Column(

      children: [
      
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 100,
          height: 145,
          child: InkWell(
            onTap: () {
              print('Image tapped!');
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantDiseasesScreen(
                  
                  description: description,
                 imagePath:imagePath, label: label,)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8), // Add space between the image and text
        Text(label),
      ],
    );
  }

}