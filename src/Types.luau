local Types = {}

export type DefaultSignature = () -> ()

type function PushFrontSignature(append: type, signature: type): type
<<<<<<< HEAD
	if signature.tag ~= "function" then
		signature = types.newfunction()
	end

	local typeParameters = signature:parameters()

	if typeParameters.head then
		for headIndex = #typeParameters.head, 1, -1 do
			local headType = typeParameters.head[headIndex]
			typeParameters.head[headIndex + 1] = headType
		end
		typeParameters.head[1] = append
	else
		typeParameters.head = {append}
	end

	return types.newfunction(typeParameters)
=======
    if signature.tag ~= "function" then
        signature = types.newfunction()
    end

    local typeParameters = signature:parameters()

    if typeParameters.head then
        for headIndex = #typeParameters.head, 1, -1 do
            local headType = typeParameters.head[headIndex]
            typeParameters.head[headIndex + 1] = headType
        end
        typeParameters.head[1] = append
    else
        typeParameters.head = {append}
    end

    return types.newfunction(typeParameters)
>>>>>>> 11c8149c34dcc1a1c995a991c7b15d690cd7c2c3
end

--[[
    RELIABLE REMOTE EVENTS
]]

export type ClientFire<
<<<<<<< HEAD
	clientToServerSignature = DefaultSignature,
	serverToClientSignature = DefaultSignature
	> = {
		FireServer: PushFrontSignature<
		any,
		clientToServerSignature
		>;
	}
export type ClientListener<
	clientToServerSignature = DefaultSignature,
	serverToClientSignature = DefaultSignature
	> = {
		Connect: (
			self: ClientListener<clientToServerSignature, serverToClientSignature>, 
			callback: serverToClientSignature
		) -> RBXScriptConnection;
		ConnectParallel: (
			self: ClientListener<clientToServerSignature, serverToClientSignature>, 
			callback: serverToClientSignature
		) -> RBXScriptConnection;
		Once: (
			self: ClientListener<clientToServerSignature, serverToClientSignature>, 
			callback: serverToClientSignature
		) -> RBXScriptConnection;
	}
export type ServerFire<
	clientToServerSignature = DefaultSignature,
	serverToClientSignature = DefaultSignature
	> = {
		FireClient: PushFrontSignature<
		any, 
		PushFrontSignature<Player, serverToClientSignature>
		>;
		FireAllClients: PushFrontSignature<
		any, 
		serverToClientSignature
		>;
	}
export type ServerListener<
	clientToServerSignature = DefaultSignature,
	serverToClientSignature = DefaultSignature
	> = {
		Connect: (
			self: ServerListener<clientToServerSignature, serverToClientSignature>, 
			callback: PushFrontSignature<Player, clientToServerSignature>
		) -> RBXScriptConnection;
		ConnectParallel: (
			self: ServerListener<clientToServerSignature, serverToClientSignature>, 
			callback: PushFrontSignature<Player, clientToServerSignature>
		) -> RBXScriptConnection;
		Once: (
			self: ServerListener<clientToServerSignature, serverToClientSignature>, 
			callback: PushFrontSignature<Player, clientToServerSignature>
		) -> RBXScriptConnection;
	}

export type Event<
	clientToServerSignature = DefaultSignature,
	serverToClientSignature = DefaultSignature
	> = {
		client: 
		ClientFire<clientToServerSignature, serverToClientSignature>
		& {
			OnClientEvent: ClientListener<clientToServerSignature, serverToClientSignature>;
		}
		;
		server: 
		ServerFire<clientToServerSignature, serverToClientSignature>
		& {
			OnServerEvent: ServerListener<clientToServerSignature, serverToClientSignature>;
		}
		;
	}
export type PrivateEvent = {
	_remoteEvent: RemoteEvent
=======
    clientToServerSignature = DefaultSignature,
    serverToClientSignature = DefaultSignature
> = {
    FireServer: PushFrontSignature<
        any,
        clientToServerSignature
    >;
}
export type ClientListener<
    clientToServerSignature = DefaultSignature,
    serverToClientSignature = DefaultSignature
> = {
    Connect: (
        self: ClientListener<clientToServerSignature, serverToClientSignature>, 
        callback: serverToClientSignature
    ) -> RBXScriptConnection;
    ConnectParallel: (
        self: ClientListener<clientToServerSignature, serverToClientSignature>, 
        callback: serverToClientSignature
    ) -> RBXScriptConnection;
    Once: (
        self: ClientListener<clientToServerSignature, serverToClientSignature>, 
        callback: serverToClientSignature
    ) -> RBXScriptConnection;
}
export type ServerFire<
    clientToServerSignature = DefaultSignature,
    serverToClientSignature = DefaultSignature
> = {
    FireClient: PushFrontSignature<
        any, 
        PushFrontSignature<Player, serverToClientSignature>
    >;
    FireAllClients: PushFrontSignature<
        any, 
        serverToClientSignature
    >;
}
export type ServerListener<
    clientToServerSignature = DefaultSignature,
    serverToClientSignature = DefaultSignature
> = {
    Connect: (
        self: ServerListener<clientToServerSignature, serverToClientSignature>, 
        callback: PushFrontSignature<Player, clientToServerSignature>
    ) -> RBXScriptConnection;
    ConnectParallel: (
        self: ServerListener<clientToServerSignature, serverToClientSignature>, 
        callback: PushFrontSignature<Player, clientToServerSignature>
    ) -> RBXScriptConnection;
    Once: (
        self: ServerListener<clientToServerSignature, serverToClientSignature>, 
        callback: PushFrontSignature<Player, clientToServerSignature>
    ) -> RBXScriptConnection;
}

export type Event<
    clientToServerSignature = DefaultSignature,
    serverToClientSignature = DefaultSignature
> = {
    client: 
        ClientFire<clientToServerSignature, serverToClientSignature>
        & {
            OnClientEvent: ClientListener<clientToServerSignature, serverToClientSignature>;
        }
    ;
    server: 
        ServerFire<clientToServerSignature, serverToClientSignature>
        & {
            OnServerEvent: ServerListener<clientToServerSignature, serverToClientSignature>;
        }
    ;
}
export type PrivateEvent = {
    _remoteEvent: RemoteEvent
>>>>>>> 11c8149c34dcc1a1c995a991c7b15d690cd7c2c3
}

export type ClientToServer<signature = DefaultSignature> = Event<signature, any>
export type ServerToClient<signature = DefaultSignature> = Event<any, signature>

<<<<<<< HEAD
return Types
=======
return Types
>>>>>>> 11c8149c34dcc1a1c995a991c7b15d690cd7c2c3
