//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
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

@objc public protocol BackendTrustProvider: NSObjectProtocol {
    /// Returns true if certificate matches what we expect it to be OR it's a host we don't need to check
    /// False if certificate doesn't match 
    @objc func verifyServerTrust(trust: SecTrust, host: String?) -> Bool
}

// Swift migration notice: this protocol conforms to NSObjectProtocol only to be usable from Obj-C.
@objc public protocol BackendEndpointsProvider: NSObjectProtocol {
    /// Backend base URL.
    var backendURL: URL { get }
    /// URL for SSL WebSocket connection.
    var backendWSURL: URL { get }
    /// URL for version blacklist file.
    var blackListURL: URL { get }
    /// Frontent URL, used to open the necessary web resources, like password reset.
    var frontendURL: URL { get }
}

@objc public protocol BackendEnvironmentProvider: BackendTrustProvider, BackendEndpointsProvider { }
