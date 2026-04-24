Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D03B9DAE;
	Fri, 24 Apr 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044735; cv=none; b=KT1Zp9Ius47cqAAB9tpnBRvobby4XrKtFtCJvdVzLLP7pca0B6M3MqkE3mvjcRhSDXM1/NOkK4fCB5SwQQXh608G0LHyL4NSiKgdbp0k2bqNtxvnRqPewj/pVnZLYFO5AK8H3u2qAVde2h3oJKclebfbFA0gaZ+fcGah+6H9fBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044735; c=relaxed/simple;
	bh=AQNUsASDSpOj+Lkb3H7zOKZpqVqbztILmTvziLzgrgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHmchbPxUZ+zejO6Ey5cHzC0Yfsg/Lr0v77uswzR5MqUy9wbY1jZBcod0lbZXZuzhQOb0I/JBWOusKJ4Bo6r4FkB6nsMt+1b1nd7PqMi0zDIMNt8pqisWltZEpR8t4yDL3NnuRZdtpbdv90eNChmzBZCkPAicpjDPJt37SykHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULCxGJtm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULCxGJtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B49C19425;
	Fri, 24 Apr 2026 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777044734;
	bh=AQNUsASDSpOj+Lkb3H7zOKZpqVqbztILmTvziLzgrgg=;
	h=From:To:Cc:Subject:Date:From;
	b=ULCxGJtm9ILnvgG84R9ZMvmn+IwwM99+YaXihChFi1fwyRGydqK110Srx4aI69LBA
	 prHa1xlDN+kI3JuAm5Xp/JjxCBzj+AKNsYy+3LPzEyiXu3P8xK1T+UE8S/Qd4+X3hw
	 frIuiMf+g8xePQ/7AiNYt55btq5Aswgpc6786PHmKhHPhOm7SvwqHvFm9fCCrlwdOA
	 aAZhpCZ/+ARtCnegsT12+Y8nCN7QRmhRCeskAbEel8pMD1yWd2mz1Z37FE7+qJ6pnl
	 H4UQCrSDyF+Rmbz9D/LfHZw85iLsKHQWpOTH1bS+w171vvyGjtJrkJUjvrk9uZZvr5
	 cs7dlZBejwqRw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGIVo-0000000B6iz-2puG;
	Fri, 24 Apr 2026 17:32:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/2] driver core: faux: fix root device registration
Date: Fri, 24 Apr 2026 17:31:25 +0200
Message-ID: <20260424153127.2647405-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the faux bus root device registration by using
root_device_register().

Included is also a related cleanup.

Johan


Changes in v2:
 - only set the faux_bus_root pointer on successful registration
 - clean up the init error handling


Johan Hovold (2):
  driver core: faux: fix root device registration
  driver core: faux: clean up init error handling

 drivers/base/faux.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

-- 
2.53.0

