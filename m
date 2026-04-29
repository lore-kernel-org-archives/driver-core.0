Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F03845A8;
	Wed, 29 Apr 2026 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494158; cv=none; b=nI2jd8Rf/afRFN8AnxEpltZHgi9TTbmDAhqnU3guG7WWskUMiEArpnTeQQpvDeUzgBabN2S+nC12Zzg+lVPTuVZmatPc6zq9dr52FdthRGrIzG+Ctol2t4U5UItWuDOGL1UOSSQIn1GYv8eCiApJa40uLGSiqWzZe1KitWh6pag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494158; c=relaxed/simple;
	bh=qnNPWgN7FL3sR+GjBITAcN5GvjAtcBavODeCEnjLmZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjQ+v0lfJetPDWZrsDtQo6P7jHgggylDRIeRaY0s5+sHmyNja4yWIu/FXq9M8M+YLJgjilSiNttnVjq0DYeR+KNqiqClwoaQRLlwrn5nRHEViiraMsFBCkOXVeIzxI7THKKMaL07oyysKd0DaY3BmIrfnNqtsYibk1xBZPLdJ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAOT78NW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAOT78NW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C54BC2BCC9;
	Wed, 29 Apr 2026 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777494157;
	bh=qnNPWgN7FL3sR+GjBITAcN5GvjAtcBavODeCEnjLmZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAOT78NWKjtL0Fv7AjWIgDozsEX+GJhVkjeapw3n/yUxMoeK7s3zK0oopQxvBB14u
	 dFii7OOpGO/ncKHos0h8eql/u+/W7t3MQPmgeY3YKShHiTo6tHj9l9s1kRWhB9uFYh
	 Ft7gl95fqYMvuKJL2XACRjDQMBj1smF2YOJWYZSC4EX/8UrEu4GUo1jAJOUa/TzWKJ
	 YYnALHMJ7u8JLfKIcTAPhaGGRVrK5MgPY49BqPcDCPIBY1sM7fX6qHRONO+VTr66BB
	 IJWIwUyEAd4mGAkIGAP02ncD9ahtlknhhmnvYIdMrcuTQ0PVyM6zSf21bW1VxUOptn
	 KtwvUt/OIQ7zg==
From: Danilo Krummrich <dakr@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] driver core: faux: fix root device registration
Date: Wed, 29 Apr 2026 22:22:33 +0200
Message-ID: <20260429202233.3132125-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424153127.2647405-1-johan@kernel.org>
References: <20260424153127.2647405-1-johan@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 24 Apr 2026 17:31:25 +0200, Johan Hovold wrote:
> [PATCH v2 0/2] driver core: faux: fix root device registration

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] driver core: faux: fix root device registration
      commit: a1ebb5fd7cc9
[2/2] driver core: faux: clean up init error handling
      commit: a54d0e24fdda

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
