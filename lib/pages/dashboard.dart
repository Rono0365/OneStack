import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fl_chart/fl_chart.dart';

class CRMDashboard extends StatefulWidget {
  const CRMDashboard({Key? key}) : super(key: key);

  @override
  State<CRMDashboard> createState() => _CRMDashboardState();
}

class _CRMDashboardState extends State<CRMDashboard> {
   final _controller  = PageController();
   int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
     
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Dashboard',style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),)),
            ListTile(
              
              subtitle: Container(
                padding: EdgeInsets.all(8.0),
  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
  height: 50.0, // 10 pixels in height
  decoration: BoxDecoration(
    color:Colors.grey.shade800,
    borderRadius: BorderRadius.circular(30.0)), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                    child: Stack(
                      children: [
                        Text("Overview",style: GoogleFonts.montserrat(
                                
                                  fontWeight: FontWeight.w500,
                                  color:_currentIndex == 0? Colors.cyan.shade600:Colors.white,
                                ),),
                               
                      ],
                    ),
                  ),
                   Container(
                    child: Stack(
                      children: [
                        Text("Analytics",style: GoogleFonts.montserrat(
                                
                                  fontWeight: FontWeight.w500,
                                  color:_currentIndex == 1? Colors.cyan.shade600:Colors.white,
                                ),),
                              
                      ],
                    ),
                  ),
                   Container(
                    child: Stack(
                      children: [
                        Text("Tasks",style: GoogleFonts.montserrat(
                                
                                  fontWeight: FontWeight.w500,
                                  color:_currentIndex == 2? Colors.cyan.shade600:Colors.white,
                                ),),
                               const Positioned(
                                  right:0,
                                  child: CircleAvatar(
                                  radius:3,
                                  backgroundColor: Colors.red,
                                ))
                      ],
                    ),
                  ),
                 
                ],),
              ),
            ),
/*
Customer Summary: Provide a quick summary of each customer or company in the CRM. Include key details like name, contact information, and their status.
Upcoming Appointments: Show upcoming appointments or meetings with customers. This helps sales and support teams stay organized.
Recent Activity: Display a timeline of recent interactions with customers, such as emails, calls, or support tickets.
Sales Pipeline: If your CRM includes sales management, display a visual representation of the sales pipeline, highlighting deals at different stages.
Key Metrics: Highlight important metrics, like the number of open deals, revenue, or customer satisfaction scores.
*/
Container(
height:MediaQuery.of(context).size.height*.8,
  child:   PageView(
  controller: _controller,
    scrollDirection: Axis.horizontal,
   onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
    children:[
  
      SizedBox(
  
       // height:MediaQuery.of(context).size.height*.8,
  
        child:ListView(
  
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child:Row(
                            children:[
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                          color: Colors.cyan.shade600,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                                width: MediaQuery.of(context).size.width*.56,
                                child: Center(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title:Text("Revenue",style: GoogleFonts.montserrat(
                  
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),),
                                     ),
                                      
                                      ListTile(
                                        title:Row(
                                          children: [
                                            Text("1,254,000 ",style: GoogleFonts.montserrat(
                  
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade100,
                    fontSize:22,
                  ),),Text("KES",style: GoogleFonts.montserrat(
                  
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize:12,
                  ),),
                                          ],
                                        ),
                                       
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:EdgeInsets.all(3.0),
                                            width:MediaQuery.of(context).size.width*.3,
                                            child: Row(
                                              
                                                children: [
                                                  Icon(Ionicons.trending_up_outline,color:Colors.cyan.shade900),
                                                   Text(" 5% ",style: GoogleFonts.montserrat(
                                                            
                                                              fontWeight: FontWeight.w300,
                                                              color: Colors.grey.shade50,
                                                            ),),
                                                            CircleAvatar(radius:2,backgroundColor: Colors.white,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0),
                                                    child: Text("Today",style: GoogleFonts.montserrat(
                                                              
                                                                fontWeight: FontWeight.w300,
                                                                color: Colors.grey.shade50,
                                                              ),),
                                                  ),
                                                ],
                                              ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                
                              ), Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width*.33,
                                 decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    elevation:0,
                    color: Colors.transparent,
                    child: SizedBox(
                                        height:200,
                    width:MediaQuery.of(context).size.width*.85,
                
                      child: LineChart(
                            LineChartData(
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [[0.0,1.0],[3.0,4.0],[5.0,8.0],[6.0,3.0],[8.0,0.5]].map((point) => FlSpot(point.first, point.last)).toList(),
                                    isCurved: true,
                                    // dotData: FlDotData(
                                    //   show: false,
                                    // ),
                                  ),
                                ],
                                 gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                ),
                              ),
                         
                        ),
                    )
                  ),
                ),
                              ),
                                      
                            ]
                          )
                        ),
                      ),
                    ),
              ],
            ),
  
            ListTile(
  
                title: Text('Customer Summary',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
                Card(
                  elevation:0,
                color:Colors.transparent,
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width*.95,
                        decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0),bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                        child: ListTile(
                           // onTap: onTap,
                            
                            title: Text(
                              "Mbugua entreprises",style: GoogleFonts.montserrat(
                                    
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                                    ),
                            ),
                            subtitle: Text(
                              "Company",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey, // Adjust the color to match your app's theme
                              ),
                            ),
                            trailing: Icon(
                              Icons.more_horiz,
                              color: Colors.grey, // Adjust the color to match your app's theme
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
  
                ListTile(
  
                title: Text('Upcoming',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child:Row(
                        children:[
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                      color: Colors.cyan.shade600,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                            width: MediaQuery.of(context).size.width*.25,
                            child: Center(
                              child: ListTile(
                                title:Text("Oct",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
                                subtitle:Text("18",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade50,
              ),),
                              ),
                            ),
                            
                          ), Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width*.69,
                             decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                            child: Center(
                              child: Wrap(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("An Upcoming Appointment",style: GoogleFonts.montserrat(
                                              
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),),
                                ),
                              ]),
                            ),
                          ),
                                  
                        ]
                      )
                    ),
                  ),
                ),
  
                ListTile(//Key Metrics
  
                title: Text('Revenue Metrics',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    elevation:0,
                    color: Colors.transparent,
                    child: SizedBox(
                                        height:200,
                    width:MediaQuery.of(context).size.width*.85,
                
                      child: LineChart(
                            LineChartData(
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [[0.0,1.0],[3.0,4.0],[5.0,8.0],[6.0,3.0],[8.0,0.5]].map((point) => FlSpot(point.first, point.last)).toList(),
                                    isCurved: true,
                                    // dotData: FlDotData(
                                    //   show: false,
                                    // ),
                                  ),
                                ],
                                 gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                ),
                              ),
                         
                        ),
                    )
                  ),
                ),
  
                
  
  ListTile(),ListTile()
  
          ],
  
        )
  
      ),
      
      //page 2
      
      SizedBox(
  
        //height:MediaQuery.of(context).size.height*.8,
  
        child:ListView(
  
          children: [
  /*
  Sales Performance: Provide charts and graphs that show sales performance over time, including revenue, sales growth, and individual salesperson performance.
Customer Segmentation: Display data on customer segments, such as demographics or industry, to help with marketing and targeting efforts.
Conversion Rates: Track conversion rates for leads, opportunities, and deals to assess the efficiency of your sales process.
Customer Retention: Show customer retention rates and reasons for churn to help you make informed decisions to improve retention.
Customer Lifetime Value (CLV): Calculate and display the CLV of your customers to help in marketing and sales strategies.
  */
            ListTile(
  
                title: Text('Sales Performance',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)
                ,trailing: InkWell(
                  onTap: () {
                    
                  },
                  child:Icon(Ionicons.information_circle,color:Colors.white)
                ),
                ),
                 /*Container(
                  height:200,
                  width:MediaQuery.of(context).size.width*.98,                   child: BarChart(
                        BarChartData(
                         barGroups: [
                          //on this barchart ... divide users in categories
                   ...[3,10,17,15,16,18,22,25].map((e) =>        BarChartGroupData(
                       
                       barRods: [
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.red,
                         ),
                         BarChartRodData(
                           toY: 20,
                           
                           color: Colors.green,
                         ),
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.blue,
                         ),
                       ], x: e,
                     )), 

                     
                         ],
                       ),
                     ),
                 ),*/
 Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    elevation:0,
                    color: Colors.transparent,
                    child: SizedBox(
                                        height:200,
                    width:MediaQuery.of(context).size.width*.85,
                
                      child: LineChart(
                            LineChartData(
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [[0.0,1.0],[3.0,4.0],[5.0,8.0],[6.0,3.0],[8.0,0.5]].map((point) => FlSpot(point.first, point.last)).toList(),
                                    isCurved: true,
                                    // dotData: FlDotData(
                                    //   show: false,
                                    // ),
                                  ),
                                ],
                                 gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                ),
                              ),
                         
                        )))),
                ListTile(
  
                title: Text('Conversion Rates',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),),
                trailing: InkWell(
                  onTap: () {
                    
                  },
                  child:Icon(Ionicons.information_circle,color:Colors.white)
                ),
                ),
                Container(
                  height:200,
                  width:MediaQuery.of(context).size.width*.98,                   child: BarChart(
                        BarChartData(
                         barGroups: [
                          //on this barchart ... divide users in categories
                   ...[3,10,17,15,16,18,22,25].map((e) =>        BarChartGroupData(
                       
                       barRods: [
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.red,
                         ),
                         BarChartRodData(
                           toY: 20,
                           
                           color: Colors.green,
                         ),
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.blue,
                         ),
                       ], x: e,
                     )), 

                     
                         ],
                       ),
                     ),
                 ),
                 ListTile(
  
                title: Text('Customer Segmentation',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)
                ,trailing: InkWell(
                  onTap: () {
                    
                  },
                  child:Icon(Ionicons.information_circle,color:Colors.white)
                ),
                ),
                Container(
                  height:200,
                  width:MediaQuery.of(context).size.width*.98,                   child: BarChart(
                        BarChartData(
                         barGroups: [
                          //on this barchart ... divide users in categories
                   ...[3,12,17,5,26,11,26,21].map((e) =>        BarChartGroupData(
                       
                       barRods: [
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.red,
                         ),
                         BarChartRodData(
                           toY: 20,
                           
                           color: Colors.green,
                         ),
                         BarChartRodData(
                           toY: e.toDouble(),
                           color: Colors.blue,
                         ),
                       ], x: e,
                     )), 

                     
                         ],
                       ),
                     ),
                 ),
  
  
                /*ListTile(//Key Metrics
  
                title: Text('Customer lifetime value (CLV)',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),),trailing: InkWell(
                  onTap: () {
                    
                  },
                  child:Icon(Ionicons.information_circle,color:Colors.white)
                ),),*/
  
               
  ListTile(),ListTile()
  
  
          ],
  
        )
  
      ),SizedBox(
  
       // height:MediaQuery.of(context).size.height*.8,
  /*
  Task List: Display a list of tasks and to-dos for the user, which could be related to specific customers or general business tasks.
Task Prioritization: Allow users to prioritize tasks and set deadlines, ensuring that important tasks are not overlooked.
Task Assignment: If your CRM is used by a team, enable task assignment and collaboration, so team members can delegate and work together on tasks.
Task Analytics
  */
        child:ListView(
  
          children: [
  
           
  
                ListTile(
  
                title: Text('Priority Task',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child:Row(
                        children:[
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                      color: Colors.red.shade600,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                            width: MediaQuery.of(context).size.width*.25,
                            child: Center(
                              child: ListTile(
                                title:Text("Oct",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
                                subtitle:Text("18",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade50,
              ),),
                              ),
                            ),
                            
                          ), Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width*.69,
                             decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                            child: Center(
                              child: Wrap(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(title:Text("This is urgentThis is urgentThis is urgentThis is urgent",style: GoogleFonts.montserrat(
                                              
                                                fontWeight: FontWeight.w500,
                                                
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle:Text("Posted by Rono",style:TextStyle(color:Colors.grey))
                                              )
                                ),
                              ]),
                            ),
                          ),
                                  
                        ]
                      )
                    ),
                  ),
                ),
                 ListTile(
  
                title: Text('Tasks',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child:Row(
                        children:[
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                      color: Colors.cyan.shade600,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                            width: MediaQuery.of(context).size.width*.25,
                            child: Center(
                              child: ListTile(
                                title:Text("Oct",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
                                subtitle:Text("18",style: GoogleFonts.montserrat(
              
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade50,
              ),),
                              ),
                            ),
                            
                          ), Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width*.69,
                             decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                            child: Center(
                              child: Wrap(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: 
                                  ListTile(title:Text("An Upcoming Appointment",style: GoogleFonts.montserrat(
                                              
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),),
                                              subtitle:Text("Posted by Rono",style:TextStyle(color:Colors.grey))
                                              )
                                  
                                ),
                              ]),
                            ),
                          ),
                                  
                        ]
                      )
                    ),
                  ),
                ),
                
  
                ListTile(//
  
                title: Text('Task Completed',style: GoogleFonts.montserrat(
  
                  fontSize: 19,
  
                  fontWeight: FontWeight.w500,
  
                  color: Colors.white,
  
                ),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child:Row(
                        children:[
                          Container(
                            height: 90,
                            decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                            width: MediaQuery.of(context).size.width*.25,
                            child: Center(
                              child: Icon(Icons.check_circle,color:Colors.white)
                            ),
                            
                          ), Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width*.69,
                             decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("A completed task",style: GoogleFonts.montserrat(
                                              
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),),
                                ),
                              ]),
                            ),
                          ),
                                  
                        ]
                      )
                    ),
                  ),
                ),
                 ListTile(),
                 ListTile()
               , ListTile(),
                 ListTile()
                 
  
  
  
          ],
  
        )
  
      ),
  
  
  
    ]
  
  ),
)
            // Add more widgets for your CRM dashboard here
          ],
        ),
      ),
      
    );
  }
}

