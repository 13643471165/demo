import {Component} from "react";
import Item from "components/Item";
import Footer from "components/Footer";

require("common/style/main.css");

class App extends Component{
    constructor(){
        super();
        this.state = {
            todoList:[],
            inputValue:'',
            view:'all'
        }
        this.addItem = this.addItem.bind(this);
        this.deleteItem = this.deleteItem.bind(this);
        this.clearCompleteItems = this.clearCompleteItems.bind(this);
        this.changeInput = this.changeInput.bind(this);
        this.toggleItem = this.toggleItem.bind(this);
        this.toggleAllItem = this.toggleAllItem.bind(this);
        this.setView = this.setView.bind(this);
        this.editContent = this.editContent.bind(this);
    }

    changeInput(ev){
        let inputValue = ev.target.value;

        this.setState({
            inputValue
        })
    }

    addItem(ev){
        if(ev.keyCode !== 13) return;
        let {todoList,inputValue} = this.state;
        let value = inputValue.trim();
        // let id = new Date().getTime;
        // let hasselect = false;

        if(!value) return;

        let todo = {};

        todo.id = new Date().getTime();
        todo.content = value;
        todo.hasselect = false;



        // if(ev.keyCode === 13){
        //     let todo = {"id":id,"content":value,"hasselect":hasselect};

        todoList.push(todo);

        this.setState({
            todoList:todoList,
            inputValue:''
        });
        // }

    }

    deleteItem(id){
        let {todoList} = this.state;
        //console.log(id);

        todoList = todoList.filter((etc)=>{
            //console.log(etc);
            return !(etc.id === id);
        });

        //console.log(todoList);

        this.setState({
            todoList:todoList
        });
    }

    clearCompleteItems(){
        let {todoList} = this.state;
        //console.log(id);

        todoList = todoList.filter((etc)=>{
            //console.log(etc);
            if(etc.hasselect){
                return false;
            }else{
                return true;
            }
            
        });

        //console.log(todoList);

        this.setState({
            todoList:todoList
        });
    }

    toggleItem(id){
        let {todoList} = this.state;

        todoList = todoList.map((etc)=>{
            if(etc.id == id){
                etc.hasselect = !etc.hasselect;
            }

            return etc;
        });

        this.setState({todoList});
    }

    toggleAllItem(ev){
        let {todoList} = this.state;
        let checked = ev.target.checked;
        //console.log(checked);

        todoList = todoList.map((etc)=>{
            etc.hasselect = checked;
            return etc;
        });

        this.setState({todoList});
    }

    setView(view){
        console.log(view);
        this.setState({
            view:view
        })
    }

    editContent(id,value){
        let {todoList} = this.state;

        todoList = todoList.map((etc)=>{
            if(etc.id == id){
                etc.content = value;
            }

            return etc;
        })

        this.setState({todoList});
    }

    render(){
        let {todoList,inputValue,view} = this.state;
        let {addItem,deleteItem,changeInput,toggleItem,toggleAllItem,clearCompleteItems,setView,editContent} = this;
        let leftItem = todoList.length;
        let items=null,
            toggleBtn=null,
            footer=null;

        items = todoList.filter((etc)=>{
            if(etc.hasselect) leftItem--;
            switch(view){
                case 'active':
                    if(etc.hasselect) return false;
                    return true;break;
                case 'completed':
                    if(etc.hasselect) return true;
                    return false;break;
                case 'all':
                    return true;
            }
        })

        items = items.map((etc,i)=>{
            return (
                <Item
                    {...etc}
                    key={i}
                    deleteItem={deleteItem}
                    toggleItem={toggleItem}
                    editContent={editContent}
                />
            )
        })

        if(todoList.length){
            toggleBtn = (
                <span>
                    <input 
                        type="checkbox" 
                        className="checkbox" 
                        id="allSelect"
                        onChange={(ev)=>toggleAllItem(ev)}
                    ></input>
                    <label htmlFor="allSelect"></label>
                </span>
            );

            footer = (
                <Footer {...{
                    leftItem:leftItem,
                    hasCompleted:todoList.length - leftItem,
                    clearCompleteItems:clearCompleteItems,
                    view:view,
                    setView:setView
                }}/>
            )
        }
        return (
            <div className="app">
                <header>
                    <div className="headline">
                        <h1>toDos</h1>
                    </div>
                    <div className="itemInput">
                        <span>{toggleBtn}</span>
                        <span><input 
                            type="text"
                            onKeyDown = { ev => addItem(ev)}
                            value = {inputValue}
                            onChange = {ev=>changeInput(ev)}  
                        ></input></span>
                    </div>
                </header>
                <content>
                    {items}
                </content>
                {footer}
            </div>
        )
    }
}

ReactDOM.render(
    <div>
        <App/>
    </div>,
    document.getElementById("root")
)