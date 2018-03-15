import {Component} from "react";

export default class Footer extends Component{
    render(){
        let {leftItem,hasCompleted,clearCompleteItems,view,setView} = this.props;
        let clearBox = null;

        //console.log(leftItem)
        if(hasCompleted){
            clearBox = (
                <span
                    onClick = {()=>clearCompleteItems()}
                >clear all completed</span>
            )
        }

        return (
            <footer>
                <span><strong>{leftItem}</strong> items left</span>
                <span>
                    <a
                        href="javascript:;" 
                        className={view==='all'?'active':''}
                        onClick={ev=>setView('all')}
                    >all</a>
                    <a
                        href="javascript:;"  
                        className={view==='active'?'active':''}
                        onClick={ev=>setView('active')}
                    >active</a>
                    <a
                        href="javascript:;" 
                        className={view==='completed'?'active':''}
                        onClick={ev=>setView('completed')}
                    >completed</a>
                </span>
                {clearBox}
            </footer>
        )
    }
}