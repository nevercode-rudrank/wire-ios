//
// Wire
// Copyright (C) 2021 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import Foundation
import WireDataModel

extension AnalyticsEvent {

    static func contributed(_ kind: AnalyticsContributionType, in conversation: ZMConversation) -> AnalyticsEvent {
        var event = AnalyticsEvent(name: "contributed")
        event.attributes = conversation.analyticsAttributes
        event.attributes[.contributionType] = kind
        return event
    }

}

enum AnalyticsContributionType: String, AnalyticsAttributeValue {

    case text = "text"
    case like = "like"
    case ping = "ping"
    case file = "file"
    case image = "image"
    case location = "location"
    case audio = "audio"
    case video = "video"
    case audioCall = "audio_call"
    case videoCall = "video_call"

    var analyticsValue: String {
        return rawValue
    }

}

private extension AnalyticsAttributeKey {

    /// The kind of message contribution.
    ///
    /// Expected to refer to a value of type `AnalyticsContributionType`.

    static let contributionType = AnalyticsAttributeKey(rawValue: "message_action")

}
