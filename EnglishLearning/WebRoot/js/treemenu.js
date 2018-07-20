function Folder(folderDescription, hreference) {
   //constant data;
   this.desc = folderDescription;
   this.hreference = hreference;
   this.id = -1;
   this.navObj = 0;
   this.iconImg = 0;
   this.nodeImg = 0;
   this.isLastNode = 0;

   this.isRoot = true;
   this.isOpen = true;
   this.iconSrc = "images/ftv2folderopen.gif";
   this.iconRoot = "images/ftv2folderopen.gif"
   this.children = new Array;
   this.nChildren = 0;

   this.initialize = initializeFolder;
   this.setState = setStateFolder;
   this.addChild = addChild;
   this.createIndex = createEntryIndex;
   this.hide = hideFolder;
   this.display = display;
   this.renderOb = drawFolder;
   this.totalHeight = totalHeight;
   this.subEntries = folderSubEntries;
   this.outputLink = outputFolderLink;
}


function setStateFolder(isOpen) {
   var subEntries;
   var totalHeight;
   var fIt = 0;
   var i = 0;

   if(isOpen == this.isOpen)
       return;

   if(browserVersion == 2) {
       totalHeight = 0
       for(i = 0; i < this.nChildren; i++)
           totalHeight = totalHeight + this.children[i].navObj.clip.height;
       subEntries = this.subEntries();

       if(this.isOpen)
           totalHeight = 0 - totalHeight;

       for(fIt = this.id + subEntries + 1; fIt < nEntries; fIt++)
           indexOfEntries[fIt].navObj.moveBy(0, totalHeight);
   }

   this.isOpen = isOpen;
   propagateChangesInState(this);
}


function propagateChangesInState(folder) {
   var i = 0;
   if(folder.isOpen) {
       if(folder.nodeImg) {
           if(folder.isLastNode)
               folder.nodeImg.src = "images/ftv2mlastnode.gif";
           else
               folder.nodeImg.src = "images/ftv2mnode.gif";
       }

       if(this.isRoot)
           folder.iconImg.src = "images/ftv2_mail.gif";
       else
           folder.iconImg.src = "images/ftv2folderopen.gif";

       for(i = 0; i < folder.nChildren; i++)
           folder.children[i].display();
   }
   else {
       if(folder.nodeImg) {
           if(folder.isLastNode)
               folder.nodeImg.src = "images/ftv2plastnode.gif";
           else
               folder.nodeImg.src = "images/ftv2pnode.gif";
       }

       if(this.isRoot)
           folder.iconImg.src = "images/ftv2_mail.gif";
       else
           folder.iconImg.src = "images/ftv2folderclosed.gif";

       for(i = 0; i < folder.nChildren; i++)
           folder.children[i].hide();
   }
}

function hideFolder() {
    if(browserVersion == 1) {
        if(this.navObj.style.display == "none")
            return;

        this.navObj.style.display = "none";
    }
    else {
        if(this.navObj.visibility == "hiden")
            return;

        this.navObj.visibility = "hiden";
    }

    this.setState(0);
}


function initializeFolder(level, lastNode, leftSide) {
    var i = 0;
    var j = 0;

    var numberOfFolders;
    var numberOfDocs;

    nc = this.nChildren;
    this.createIndex();

    var nc;
    var auxEv = "";

    if(browserVersion > 0)
        auxEv = "<A HREF='JavaScript: clickOnNode("+this.id+")'>";
    else
        auxEv = "<A>";

    if(level > 0) {
        if(lastNode) { //the last 'brother' in the children array
           this.renderOb(leftSide + auxEv + "<IMG NAME='nodeIcon" + this.id + "' SRC='images//ftv2mlastnode.gif' WIDTH=16 HEIGHT=22 BORDER=0></A>");
           leftSide = leftSide + "<IMG SRC='images/ftv2blank.gif' WIDTH=16 HEIGHT=22>";
           this.isLastNode = 1;
        }
        else {
            this.renderOb(leftSide + auxEv + "<IMG NAME='nodeIcon" + this.id + "' SRC='images//ftv2mnode.gif' WIDTH=16 HEIGHT=22 BORDER=0></A>");
            leftSide = leftSide + "<IMG SRC='images/ftv2vertline.gif' WIDTH=16 HEIGHT=22>";
            this.isLastNode = 0;
        }
    }
    else {
        this.renderOb("");
    }

    if(nc > 0) {
        level = level + 1;
        for(i = 0; i < this.nChildren; i++) {
            if(i == this.nChildren-1)
                this.children[i].initialize(level, 1, leftSide);
            else
                this.children[i].initialize(level, 0, leftSide);
        }
    }
}


function drawFolder(leftSide) {
    if(browserVersion == 2) {
        if(!doc.yPos)
          doc.yPos = 8;

        doc.write("<layer id='folder" + this.id + "' TOP=" + doc.yPos + " visibility=hiden>");
    }
    doc.write("<table")

    if(browserVersion == 1)
        doc.write(" id='folder" + this.id + "' style='position:block;' ");

    doc.write(" border=0 cellspacing=0 cellpadding=0>");
    doc.write("<tr><td>");
    doc.write(leftSide);

    this.outputLink();

    doc.write("<img name='folderIcon" + this.id + "' ");
    if(leftSide == '') {
        doc.write("src='" + this.iconRoot+"' border=0></a>");
    }
    else {
        doc.write("src='" + this.iconSrc+"' border=0></a>");
    }

    doc.write("</td><td nowrap>");

    doc.write("<div class=\"fldrroot\">");

    if(leftSide == '') {
       if(USETEXTLINKS) {
          this.outputLink();
          doc.write(this.desc + "</a>");
       }
       else
         doc.write(this.desc);
    }
    else {
        doc.write("<a href='JavaScript: clickOnNode("+this.id+")'>");
        doc.write(this.desc + "</a>");
    }

    doc.write("</div>");
    doc.write("</td>");
    doc.write("</table>");

    if(browserVersion == 2) {
        doc.write("</layer>");
    }

    if(browserVersion == 1) {
        this.navObj = doc.all["folder"+this.id];
        this.iconImg = doc.all["folderIcon"+this.id]
        this.nodeImg = doc.all["nodeIcon"+this.id]
    }
    else if(browserVersion == 2) {
        this.navObj = doc.layers["folder"+this.id];
        this.iconImg = this.navObj.document.images["folderIcon"+this.id];
        this.nodeImg = this.navObj.document.images["nodeIcon"+this.id];
        doc.yPos = doc.yPos + this.navObj.clip.height;
    }
}


function outputFolderLink() {
    if(this.hreference) {
        doc.write("<a href='" + this.hreference + "' target=\"right_frame\" ")

        if(browserVersion > 0) {
            doc.write("onclick='JavaScript: clickOnFolder("+this.id+")'")
        }
        doc.write(">")
    }
    else
        doc.write("<a>")
}


function addChild(childNode) {
    this.children[this.nChildren] = childNode;
    this.nChildren++;

    return(childNode);
}


function folderSubEntries() {
    var i = 0;
    var se = this.nChildren;

    for(i = 0; i < this.nChildren; i++) {
        if(this.children[i].children) //is a folder
            se = se + this.children[i].subEntries();
    }

    return(se)
}

function Item(itemDescription, hreference, itemLink, itemImg) // Constructor
{
    this.desc = itemDescription
    this.link = itemLink
    this.hreference = hreference;
    this.id = -1;    
    this.navObj = 0;  
    this.iconImg = 0; 
    this.iconSrc = itemImg;
    this.initialize = initializeItem ;
    this.createIndex = createEntryIndex;
    this.hide = hideItem;
    this.display = display;
    this.renderOb = drawItem;
    this.totalHeight = totalHeight;
}
function hideItem() {
    if(browserVersion == 1) {
        if(this.navObj.style.display == "none")
            return;
        this.navObj.style.display = "none"
    }
    else {
        if(this.navObj.visibility == "hiden")
            return;
        this.navObj.visibility = "hiden";
    }
}
function initializeItem(level, lastNode, leftSide) {
    this.createIndex();

    if(level > 0) {
        if(lastNode) { 
            this.renderOb(leftSide + "<img src='images/ftv2lastnode.gif' width=16 height=22>")
            leftSide = leftSide + "<img src='images/ftv2blank.gif' width=16 height=22>"
        }
        else {
            this.renderOb(leftSide + "<img src='images/ftv2node.gif' width=16 height=22>")
            leftSide = leftSide + "<img src='images/ftv2vertline.gif' width=16 height=22>"
        }
    }
    else
        this.renderOb("")
}


function drawItem(leftSide) {
    if(browserVersion == 2)
        doc.write("<layer id='item" + this.id + "' TOP=" + doc.yPos + " visibility=hiden>");
    doc.write("<table ");
    if(browserVersion == 1)
        doc.write(" id='item" + this.id + "' style='position:block;' ");
    doc.write(" border=0 cellspacing=0 cellpadding=0>");
    doc.write("<tr><td>");
    doc.write(leftSide);
    if(this.link != "")
        doc.write("<a href=" + this.link + ">");
    doc.write("<img id='itemIcon"+this.id+"' ")
    doc.write("src='"+this.iconSrc+"' border=0>")
    if(this.link != "")
        doc.write("</a>");

    doc.write("</td><td nowrap>");
    doc.write("<div class=\"fldritem\">");
    if(USETEXTLINKS) {
        if(this.link != "")
            doc.write("<a href=" + this.link + ">" + this.desc + "</a>");
        else
            doc.write(this.desc);
    }
    else {
        doc.write(this.desc);
    }

    doc.write("</div>");
    doc.write("</table>")

    if(browserVersion == 2)
        doc.write("</layer>");

    if(browserVersion == 1) {
        this.navObj = doc.all["item"+this.id]
        this.iconImg = doc.all["itemIcon"+this.id]
    }
    else if(browserVersion == 2) {
        this.navObj = doc.layers["item"+this.id];
        this.iconImg = this.navObj.document.images["itemIcon"+this.id];
        doc.yPos = doc.yPos+this.navObj.clip.height;
    }
}
function display() {
    if(browserVersion == 1)
        this.navObj.style.display = "block";
    else
        this.navObj.visibility = "show";
}
function createEntryIndex() {
    this.id = nEntries;
    indexOfEntries[nEntries] = this;
    nEntries++;
}
function totalHeight() {
    var h = this.navObj.clip.height;
    var i = 0;

    if(this.isOpen) { 
        for(i = 0 ; i < this.nChildren; i++)
            h = h + this.children[i].totalHeight();
    }

    return h
}
function clickOnFolder(folderId) {
    var clicked = indexOfEntries[folderId];
    if(!clicked.isOpen)
        clickOnNode(folderId);
    if(clicked.isSelected)
        return;
}
function clickOnNode(folderId) {
    var clickedFolder = 0;
    var state = 0;
    clickedFolder = indexOfEntries[folderId];
    state = clickedFolder.isOpen;
    clickedFolder.setState(!state); 
}
function initializeDocument(Num) {
    if(doc.all)
        browserVersion = 1; 
    else if(doc.layers)
        browserVersion = 2; 
    else
        browserVersion = 0; 

    foldersTree.initialize(0, 1, "");
    foldersTree.display();

    if(browserVersion > 0) {
        doc.write("<LAYER TOP="+indexOfEntries[nEntries-1].navObj.top+">&nbsp;</LAYER>");
        clickOnNode(Num);
        clickOnNode(Num);
    }
}
function initializeDocument2(Num) {
    if(doc.all)
        browserVersion = 1; 
    else if(doc.layers)
        browserVersion = 2; 
    else
        browserVersion = 0; 
    MenuTree.initialize(0, 1, "");
    MenuTree.display();

    if(browserVersion > 0) {
        doc.write("<layer TOP="+indexOfEntries[nEntries-1].navObj.top+">&nbsp;</layer>");
        clickOnNode(Num);
        clickOnNode(Num);
    }
}
function gFldr(description, hreference) {
    folder = new Folder(description, hreference);
    return(folder);
}
function gLnk(target, description, linkData, itemImg) {
    fullLink = ""
    if(target == 0) {
        if(linkData != "")
            fullLink = "'"+linkData+"' target=\"right_frame\"";
        else
            fullLink = "";
    }
    else if(target == 1) {
        if(linkData != "")
            fullLink = "'"+linkData+"' target=\"_top\"";
        else
            fullLink = "";
    }
    else { // target == 2
        if(linkData != "")
            fullLink = "'http://"+linkData+"' target=\"right_frame\"";
        else
            fullLink = "";
    }

    linkItem = new Item(description, linkData, fullLink, itemImg)
    return linkItem
}


function insFldr(parentFolder, childFolder) {
    return(parentFolder.addChild(childFolder));
}


function insDoc(parentFolder, document) {
    parentFolder.addChild(document);
}
	USETEXTLINKS = 1;
	indexOfEntries = new Array;
	nEntries = 0;
	doc = document;
	browserVersion = 0;
	selectedFolder = 0;