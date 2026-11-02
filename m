Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577834;
	b=XX32Ru5d7zLqFQSz1mhNmLLQhIBheRtgnYpwmsFmcc3wNLXS9Q/P7FfiU7fnwkNx+N6d
	 h3nwxZn/kgKVczLV4BiCDCus6l2lq81Ctm60Q/B+4gvrwne4BpMbMlMxfJ5cf+4hSawhX
	 rXVOe1w6UXx3SVL9XcHgJUdWKyfwQ3r7Wx++a6dyTqEBOivelj8JeMowPJTKKss5fIjsm
	 0tuxGu03ZAf7vSwZEtIPqo0EfQIjaET3BjVh3xcC/CyOPe0w5fH6m518dTHDdrIWdVIK4
	 mv5EG2CziL58A62zB50FFUH4KOXZDYOSacPshvoWJ5pXibF5US+ouQMMwtO961gR3Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577834;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pp4vhN14Q2gwg100oScJFJol+kV3nsbiPZyTSymjTNc=;
	b=ugaiuTq61S8fZnDUwa6R+DjNn4Pn/32pJ3UPE9ZccI4T7zSbdzudbP6hNU8E9ROlZCxP
	 fxZuiWQEGULf51G8L8NgLVGysgoxG2pb6hlr3adOVhPp3bpJ07ZvJBpDi5xTLnwq4GRRU
	 xBjXm4kfXiQITqvhNOJiVG4D0vLKqXDGTHP/BYClvuil1BdOHCP/z1ardU6879EoEn8vr
	 Juve9GDjPriDtGcmE9+eEGSpb6WiFJhjBbIWNzdjBlBxETggSC+w16cVe43WM4RMObNq2
	 bIsIZQ/YG/IyHlscURllCNFiCPVB115BgM9+W1TL+GlXAwPo9UYqAR9xHyvKQBfBOLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2pywuqr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C1606A324;
	Mon,  2 Nov 2026 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2pywuqr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE901F00919;
	Mon,  2 Nov 2026 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577834;
	bh=pp4vhN14Q2gwg100oScJFJol+kV3nsbiPZyTSymjTNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z2pywuqrzSAIC0lnTd9JjvsnEuy1tWvhRD77DIAJatP4DDsdZTPdVIvtU+SftJUZV
	 +mUPEXk9O6kyoAqUzddl+pgQO5k5xMiFumu2+U2rKuFyL10CSNnTTgu7ZGj0z7AwC6
	 7qU5YuYtVz8T0GroydkOVXY0Zn1l0SZjePIoAVZysk2UmXc267pQvUpmfiQE/B6EAm
	 aqFcLecDx/w/4teZwBPUDg1yr+ctAJ+JXV2IsZ90F35q7iltDQ5NXbLDRsJPpbQvY6
	 ejniUzkM1UMIvnzar9/PZ1a0KVFKcPI60uc6jkwg8oERPLGeCESy9tFZ2lUHyWwA+F
	 XKC0o15VXxCEQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Atanas Kunchev <atanaskunchev@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: attribute_container: document return values
Date: Mon,  2 Nov 2026 01:03:46 +0100
Message-ID: <20261102000346.2510043-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024-kdoc-attrcont-v1-1-b18627a05e97@proton.me>
References: <20261024-kdoc-attrcont-v1-1-b18627a05e97@proton.me>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 24 Oct 2026 11:23:38 +0300, Atanas Kunchev wrote:
> [PATCH] driver core: attribute_container: document return values

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: attribute_container: document return values
      commit: 58680cc2af0f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
