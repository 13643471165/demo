import {Component} from "react";

export default class Item extends Component{
    constructor(props){
        super(props);
        let {content} =  props;
        this.state = {
            edit:false,
            val:content
        }
        this.changeEdit = this.changeEdit.bind(this);
        this.changeInput = this.changeInput.bind(this);
        this.onBlur = this.onBlur.bind(this);
        this.onEnter = this.onEnter.bind(this);
        this.editContent = this.editContent.bind(this);
    }

    editContent(){
        this.setState({edit});
        let {editContent,id} = this.props;
        //console.log(id);
        //console.log(editContent);
        let {val} = this.state;

        editContent(id,val);

        let edit = 'false';
        //console.log(edit);

        
    }

    onBlur(){
        this.editContent();
    }

    onEnter(ev){
        if(ev.keyCode !== 13) return;

        this.editContent();
    }

    changeEdit(){
        let {edit} = this.state;
        edit = !edit;
        //console.log(edit);
        this.setState({
            edit
        })
    }

    changeInput(ev){
        let val = ev.target.value;

        this.setState({
            val
        })
    }

    render(){
        let {id,content,hasselect,deleteItem,toggleItem} = this.props;
        let isChecked = '';
        let {edit,val} = this.state;
        let {changeEdit,changeInput,onBlur,onEnter} = this;
        let doubleClickShow = '';
        //console.log(edit);

        if(edit){
            doubleClickShow = 'doubleClickShow';
        }

        console.log(doubleClickShow);

        if(hasselect){
            isChecked = "isChecked"
        }

        return (
            <div className="item">
                <span>
                        <input 
                            type="checkbox" 
                            className="checkbox" 
                            id={id+""}
                            onChange={ev=>toggleItem(id)}
                            checked={hasselect}
                        ></input>
                        <label htmlFor={id+""}></label>
                </span>
                <span 
                    className={isChecked}
                    onDoubleClick={changeEdit}
                >{content}</span>
                <input 
                    className={doubleClickShow} 
                    value={val}
                    onChange = {ev=>changeInput(ev)}
                    onKeyDown = {(ev)=>onEnter(ev)}
                    onBlur = {onBlur}
                ></input>
                <span><button
                        onClick = {()=>deleteItem(id)} 
                ></button></span>
            </div>
        )
    }
}