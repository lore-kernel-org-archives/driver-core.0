Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACAB640;
	Mon,  4 May 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876528; cv=none; b=TXPOySe+VdOlBznY8OnJsjwtmjq3XHNnzd76E2K5dPR7wWOKBWBPtFVnX55NwGpsh+TOOPM5ESg+8gkhOX8QUTpdaOx9+c9J+LoioTNaUp84rjMzpmPFp/qUqHSaNfJ7GxFZZRVswGqT508wuMwuNeYAUYDbm+D3CRYFnAt3XGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876528; c=relaxed/simple;
	bh=9rpSPV3ZPugDrz+K1Oxjt0MUYGqQzhFBP0oUNrlqsls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGPHmds9OtfQl4tPK98uXwGu9Y8F2ciYfwFDom//HpUVxU/wZRNt3OLiN8jsnr0es4LiA1NfTz855BSZo+GPm7e+s2ieHGzeIc6iJbQ3OCL3N1q3LhgDUo2fMs14VYFm/nmTHZbHNX1AztUJF3RyIjPB/4yxR2HqIhgWdmmN5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UK6muk48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK6muk48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2717C2BCB8;
	Mon,  4 May 2026 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777876528;
	bh=9rpSPV3ZPugDrz+K1Oxjt0MUYGqQzhFBP0oUNrlqsls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UK6muk485H6RVgdub7f3Ln42g3AASzfYbTkGOSk/hdQQiv3jT4J3NlnmH8ydEUXAT
	 bk54eUl2P4jK7VPmZ2kDiKrqRVj96c+UV3xmzmNcz4nmFPT5Ph4/xHd78oUF3sNK7z
	 1kbx5HuuVpmNR8a9q1O12fus2wIv6yikGAap42TisWG56jxbB2hSdCFOnu4nGhKfor
	 hqtcncU81VA92it8qCBpeFsdaHvt9/c5DCZG+lBI2XwIG4oZANEgnZm1/d6KTVvk9i
	 o89gVoNgvQs1OuTvoLw0oJ0/oXS2RYhU4+B9ZaWcMYkLA/OB2Y3bxHaKQoC4jjhGS5
	 cpZNM7bs/U9Bg==
From: William Breathitt Gray <wbg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: switch to dynamic root device
Date: Mon,  4 May 2026 15:35:17 +0900
Message-ID: <20260504063518.515620-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DI95SZ1X7Q2U.DG2BN03FERO9@kernel.org>
References: <DI95SZ1X7Q2U.DG2BN03FERO9@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=wbg@kernel.org; h=from:subject; bh=9rpSPV3ZPugDrz+K1Oxjt0MUYGqQzhFBP0oUNrlqsls=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJk/7OS9eEot6+c4Clgt1nGL/MMg8XH9oc+Zv7QuJE3/J mY83bSno5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjIuj0M/ywyAnJdVj3gU1gz R19S61sTZ3CGp98c35QPJ1scZcOuXWb4Z6ezMvpBtJCX3PXr012ThDOOFbyNelyw1K+h7csluwX cXAA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Sun, May 03, 2026 at 05:50:17PM +0200, Danilo Krummrich wrote:
> On Sun May 3, 2026 at 7:08 AM CEST, William Breathitt Gray wrote:
> > Would you resend with a Fixes tag
> 
> Devices should generally be allocated dynamically for various reasons (e.g. I
> recently had a case where adding a dynamic lock class key to struct device for
> debugging purposes caused warnings for all the static devices).
> 
> While it clearly should be improved, I don't think this causes a bug in the ISA
> code -- there is no "real" leak as the device is static anyway and there's no
> spurious WARN() as release() is never hit, since ISA is always built-in.
> 
> I'd assume this is why Johan did not add it in the first place.
> 
> That said, if you mean to add a Fixes: tag anyway to indicate the technically
> wrong usage pattern of struct device, that seems reasonable to me.

Okay that makes sense, this is improvement of the code rather than a
true bug fix, so we don't need a Fixes tag.

Johan, I do have another request. Would you refactor the changes in
isa_bus_init() to avoid the nested blocks? For example:

	error = bus_register(&isa_bus_type);
	if (error)
		return error;

	isa_bus = root_device_register("isa");
	if (IS_ERR(isa_bus)) {
		bus_unregister(&isa_bus_type);
		return PTR_ERR(isa_bus);
	}

	return 0;

I believe that makes the logic easier to understand when reading the
code here.

William Breathitt Gray
