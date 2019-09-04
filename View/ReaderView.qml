import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "../Item"
import "../Popup"
Rectangle{
    id:root;
    width: 400;
    height: 600;
    property var backcolor:"#FFE4B5";
    property var fontcolor: "black";
    property var fontSize: 15;
    property var footColor: "black"
    Rectangle{
        id:fonter;
        width: parent.width;
        height: 15;
        color: backcolor;
        z:3
        Text {
            anchors.left: parent.left;
            anchors.margins: 2
            id: name
            text: qsTr("第1章:序幕");
            font.pixelSize:10
            color: fontcolor
        }
    }
    Rectangle{
        width: 400;
        height: parent.height-footer.height-fonter.height;
        anchors.top: fonter.bottom;
        color: backcolor
        Flickable {

            id: view
            contentX: width;
            contentHeight: readerText.height;
            width: parent.width;
            height: parent.height;

            property var isSetting: 0
            //y:mouse.y-contentY
            Rectangle{
                width: parent.width;
                height: parent.height;
                color: "transparent";
                TextArea {
                    id:readerText;
                    width: parent.width
                    readOnly: true;
                    color: fontcolor;
                    text: "TextArea\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n\n...\n...\n...\n...\n...\n...\n"
                    wrapMode: Text.WrapAnywhere
                    onTextChanged: {
                        view.contentHeight=readerText.height;
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            console.log(view.isSetting);
                            if(footSetter.isBrightNess==1 && mouseY%parent.height<root.height-showBrightNess.height){
                                    footSetter.isBrightNess=0;
                            }
                            else if(footSetter.isSetting==1&&  mouseY%parent.height<root.height-showSettingBottom.height){
                                footSetter.isSetting=0;
                            }
                            else if(view.isSetting==0&& mouseX>width/2-width/5*1 && mouseX< width/2+width/5*1){
                                    view.isSetting=1;
                                    showFont.start();
                                    showFoot.start();
                            }
                            else if(view.isSetting==1 &&mouseY%root.height>fontSetter.height  && mouseY%root.height<root.height-footSetter.height){
                                   view.isSetting=0;
                            }
                            else if(footSetter.isCatalogView==1 && mouseX>showCatalogs.width){
                                    footSetter.isCatalogView=0;
                            }


                        }
                    }
                }
            }

        }
    }
    Rectangle{
        id:footer;
        width: parent.width;
        height: 15;
        color: backcolor;
        anchors.bottom: root.bottom;
        Text {
            color:backcolor;
            anchors.left: parent.left;
            height: parent.height
            anchors.leftMargin: 5;
            id: currentRead;
            font.pixelSize: 10;
            font.italic: true;
            text: qsTr("0.09%");
        }
        Rectangle{
            width: 50;
            height: parent.height;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            color: backcolor;
            Text{
                anchors.left: parent.left;
                text: "10:00";
                color: fontcolor;
                font.pixelSize: 10
            }

        }

    }
    Rectangle{
        id:fontSetter;
        width: parent.width;
        height: 40;
        visible: view.isSetting;
        opacity: 0.9
        z:4;
        //anchors.top: parent.top;
        color: footColor
        Rectangle{
            width: parent.width-anchors.rightMargin-anchors.leftMargin;
            height: parent.height-anchors.topMargin-anchors.bottomMargin;
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.left: parent.left;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;
            anchors.topMargin: 10;
            anchors.rightMargin: 20;
            anchors.leftMargin: 20;
            color: "transparent";
            RowLayout{
                width: parent.width;
                height: parent.height;
                anchors.fill: parent;
                //左键头 表示返回
                Rectangle{
                    height: parent.height;
                    width: 20;
                    color: "transparent"
                    Image {
                        anchors.fill: parent;
                        source: "../Images/back.png"
                    }


                }
                Rectangle{
                    width: 100;
                    height: parent.height;
                    color: "transparent";


                }
                Rectangle{
                    id:buyButton;
                    height: parent.height;
                    width: 40;
                    radius: 8;
                    color: "transparent"
                    Text {
                        anchors.fill: parent;
                        text: qsTr("购买")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter;
                        color: "#FF4500"
                        font.pixelSize: 10;
                    }
                    border.color: "#FF4500"

                }
                Rectangle{
                    id:giftButton;
                       width: 25;
                       height: parent.height;
                       color: "transparent";
                       Image {
                           anchors.fill: parent;
                           source: "../Images/giftButton.png"
                       }
                }
                Rectangle{
                    id:headsetButton;
                       width: 25;
                       height: parent.height;
                       color: "transparent";
                       Image {
                           anchors.fill: parent;
                           source: "../Images/HeadsetButton.png"
                       }
                }
                Rectangle{
                    id:listButton;
                       width: 25;
                       height: parent.height;
                       color: "transparent";
                       Image {
                           anchors.fill: parent;
                           source: "../Images/listButton.png"
                       }
                }
            }

        }
        ParallelAnimation{
            id: showFont;
            PropertyAnimation{
                id: showFontY;
                target: fontSetter;
                from:root.height+footSetter.height;
                to:root.height-footSetter.height;
                duration: 1000
            }
            PropertyAnimation{
                id: showFontOpacy;
                target: fontSetter;
                property:"opacity";
                from:0
                to:0.9
                duration: 1000
            }
        }
    }
    Rectangle{
        id:footSetter;
        width: parent.width;
        height: 100;
        visible: view.isSetting;
        color: footColor;
        property var isCatalogView: 0       //目录是否显示
        property var isBrightNess: 0
        property var isNeight: 0
        property var isSetting: 0
        RowLayout{
                id:process;
                height: 50;
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                anchors.right: parent.right;
                anchors.rightMargin: 20;
                Rectangle{
                    width: 50;
                    height: 20;
                    color: "transparent"
                    Text {
                        color: "white"
                        text: qsTr("上一章")

                    }
                }
                Rectangle{
                    height: 50;
                    width: 200;
                    color: "transparent"
                    Slider{
                        width: parent.width;
                        from:0;
                        to:100;
                        stepSize:1

                    }
                }
                Rectangle{
                    width: 50;
                    height: 20;
                    color: "transparent"
                    Text {
                        color:"white"
                        text: qsTr("下一章")
                    }
                }
        }
        RowLayout{
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.right: parent.right;
            anchors.rightMargin: 40;
            height: 40;


            // spacing:10;
            SettingButton{
                id:catalog;
                width: 30;
                height: 40;
                buttonText :qsTr("目录")
                buttonIconPath:"../Images/catalog.png";
                buttonBackColor: "transparent";
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        showCatalogAnimation.start();
                        footSetter.isCatalogView=1;
                        view.isSetting=0;
                    }
                }
            }
            SettingButton{
                id:brightness
                width: 30;
                height: 40;
                buttonText: qsTr("亮度")
                buttonIconPath: "../Images/brightness.png"
                buttonBackColor: "transparent"
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        showBrightNessAnimation.start();
                        footSetter.isBrightNess=1;
                        view.isSetting=0;

                    }

                }
            }
            SettingButton{
                id:nightModel
                width: 30;
                height: 40;
                buttonText: qsTr("夜间")
                buttonIconPath: "../Images/nightmodel.png"
                buttonBackColor: "transparent"
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        footSetter.isNeight=!footSetter.isNeight;
                        nightModel.buttonIconPath=footSetter.isNeight?"../Images/nightmodel.png":"../Images/brightness.png"

                    }

                }
            }
            SettingButton{
                id:set;
                width: 30;
                height: 40;
                buttonText: qsTr("设置")
                buttonIconPath: "../Images/set.png"
                buttonBackColor: "transparent"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        footSetter.isSetting=!footSetter.isSetting;
                        showSettingBottomAnimation.start();
                        view.isSetting=0;
                    }
                }
            }
        }
        ParallelAnimation{
            id:showFoot;
            PropertyAnimation{
                id: showFootY;
                target: footSetter;
                property:"y";
                from:root.height+footSetter.height;
                to:root.height-footSetter.height;
                duration: 1000
            }
            PropertyAnimation{
                id: showFootOpacy;
                target: footSetter;
                property:"opacity";
                from:0
                to:0.9
                duration: 1
            }
        }
    }

    PopupCatalog{
        id:showCatalogs;
        height: parent.height;
        width: parent.width-1.0/5.0*parent.width
        x:-width;
        z:3;
        visible: footSetter.isCatalogView;
        opacity: 0;

        ParallelAnimation{
            id:showCatalogAnimation;
            PropertyAnimation{
                id: showCatalogX;
                target: showCatalogs;
                property:"x";
                from:-width;
                to:0;
                duration: 1000
            }
            PropertyAnimation{
                id: showCatalogOpacty;
                target: showCatalogs;
                property:"opacity";
                from:0
                to:0.9
                duration: 1000
            }
        }
    }
    BrightNess{
        id:showBrightNess;
        height: parent.height*1/4.0;
        width: parent.width;
        visible:footSetter.isBrightNess;
        color: footColor
        z:2;
        y:root.height+height;
        ParallelAnimation{
            id:showBrightNessAnimation;
            PropertyAnimation{
                target: showBrightNess ;
                property:"y";
                from:root.height+showBrightNess.height;
                to:root.height-showBrightNess.height;
                duration: 1000
            }
            PropertyAnimation{
                target: showCatalogs;
                property:"opacity";
                from:0
                to:0.9
                duration: 1000
            }
        }


    }
    SettingBottom{
        id:showSettingBottom;
        visible: footSetter.isSetting
        width: parent.width;
        backgroundColor:fontcolor
        fontSize:root.fontSize;
        height: 200;
        y:root.height+height;
        z:2;
        ParallelAnimation{
            id:showSettingBottomAnimation;
            PropertyAnimation{
                target: showSettingBottom ;
                property:"y";
                from:root.height+showSettingBottom.height;
                to:root.height-showSettingBottom.height;
                duration: 1000
            }
            PropertyAnimation{
                target: showSettingBottom;
                property:"opacity";
                from:0
                to:0.9
                duration: 1000
            }
        }
    }
}
