//
//  StateLinks.swift
//  MobileVoterOutreachApplication
//
//  Created by AK Alilonu on 7/8/18.
//  Copyright © 2018 Dylan  Irlbeck. All rights reserved.
//

import Foundation

import UIKit

// registerLink -> registerToVoteLink
// requestMailInBallot -> requestMailInBallotLink

class State {
    var name = String()
    var canRegisterOnline = Bool()
    var registerLink = String()
    var checkRegistrationLink = String()
    var canVoteEarly = Bool()
    var requestMailInBallot = String()
    var checkBallotLink = String()
    var findPollingPlaceLink = String()
}

func makeState(name: String, canRegisterOnline: Bool, registerLink: String, checkRegistrationLink: String, canVoteEarly: Bool, requestMailInBallot: String, checkBallotLink: String, findPollingPlaceLink: String) -> State {
    // initializes a states Bool values and hardcoded links
    let s = State()
    s.name = name
    s.canRegisterOnline = canRegisterOnline
    s.registerLink = registerLink
    s.checkRegistrationLink = checkRegistrationLink
    s.canVoteEarly = canVoteEarly
    s.requestMailInBallot = requestMailInBallot
    s.checkBallotLink = checkBallotLink
    s.findPollingPlaceLink = findPollingPlaceLink
    return s
}

// array of state names
let stateNamesArray = ["Alabama",
                       "Alaska",
                       "Arizona",
                       "Arkansas",
                       "California",
                       "Colorado",
                       "Connecticut",
                       "Delaware",
                       "District of Columbia",
                       "Florida",
                       "Georgia",
                       "Hawaii",
                       "Idaho",
                       "Illinois",
                       "Indiana",
                       "Iowa",
                       "Kansas",
                       "Kentucky",
                       "Louisiana",
                       "Maine",
                       "Maryland",
                       "Massachusetts",
                       "Michigan",
                       "Minnesota",
                       "Mississippi",
                       "Missouri",
                       "Montana",
                       "Nebraska",
                       "Nevada",
                       "New Hampshire",
                       "New Jersey",
                       "New Mexico",
                       "New York",
                       "North Carolina",
                       "North Dakota",
                       "Ohio",
                       "Oklahoma",
                       "Oregon",
                       "Pennsylvania",
                       "Rhode Island",
                       "South Carolina",
                       "South Dakota",
                       "Tennessee",
                       "Texas",
                       "Utah",
                       "Vermont",
                       "Virginia",
                       "Washington",
                       "West Virginia",
                       "Wisconsin",
                       "Wyoming"]

// array of state objects
let statesArray = [makeState(name: "Alabama",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Alaska",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Arizona",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Arkansas",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "California",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Colorado",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Connecticut",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Delaware",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "District of Columbia",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Florida",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Georgia",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Hawaii",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Idaho",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Illinois",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Indiana",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Iowa",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Kansas",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Kentucky",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Louisiana",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Maine",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Maryland",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Massachusetts",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Michigan",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Minnesota",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Mississippi",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Missouri",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Montana",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Nebraska",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Nevada",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "New Hampshire",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "New Jersey",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "New Mexico",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "New York",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "North Carolina",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "North Dakota",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Ohio",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Oklahoma",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Oregon",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Pennsylvania",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Rhode Island",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "South Carolina",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "South Dakota",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Tennessee",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Texas",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Utah",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Vermont",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Virginia",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Washington",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: false,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "West Virginia",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Wisconsin",
                             canRegisterOnline: true,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: ""),
                   makeState(name: "Wyoming",
                             canRegisterOnline: false,
                             registerLink: "",
                             checkRegistrationLink: "",
                             canVoteEarly: true,
                             requestMailInBallot: "",
                             checkBallotLink: "",
                             findPollingPlaceLink: "")]

func initStateDictionary(withKeys: [String], andValues: [State]) -> Dictionary<String,State> {
    // initializes dictionary of states
    var stateDictionary = Dictionary<String,State>()
    stateDictionary.reserveCapacity(51)
    for stateName in withKeys {
        for state in andValues {
            print(stateName + "\n" + state.name)
            state.name = stateName
            stateDictionary.updateValue(state, forKey: stateName)
        }
    }
    return stateDictionary
}

let stateDictionary = initStateDictionary(withKeys: stateNamesArray, andValues: statesArray)

func getLink(to search: String, in state: String) -> String {
    // creates link to website
    let space = "%20"
    let search = search.replacingOccurrences(of: " ", with: space)
    let link = "http://www.google.com/search?q=" + search + space + state + "&btnI"
    return link
}

func getState(of stateName: String) -> State {
    // completes state initialization
    var state = stateDictionary[stateName]!
    if state.registerLink == "" {
        state.registerLink = getLink(to: "register to vote in", in: stateName)
    }
    if state.checkRegistrationLink == "" {
        state.checkRegistrationLink = getLink(to: "am i registered to vote in", in: stateName)
    }
    if state.requestMailInBallot == "" {
        state.requestMailInBallot = getLink(to: "request ballot", in: stateName)
    }
    if state.checkBallotLink == "" {
        state.checkBallotLink = getLink(to: "where is my ballot", in: stateName)
    }
    if state.registerLink == "" {
        state.findPollingPlaceLink = getLink(to: "where is my polling place", in: stateName)
    }
    return state
}


