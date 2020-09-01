import React from 'react';

const Navbar = () => {

    return (
        <nav className="navbar navbar-expand-sm fixed-top navbar-light">
            <div className="container-fluid">
                <button className="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <a className="navbar-brand text-left" href="#">
                    <h2 className="text-white"><strong>SUPPLY CHAIN DAPP</strong></h2>
                </a>
                <div className="collapse navbar-collapse navbar-right" id="navbar1">
                    <ul className="navbar-nav">
                        <li className="nav-item active">
                            <a className="nav-link btn btn-success px-5 text-white" href="#">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default Navbar;