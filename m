Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570183;
	b=TH2DlsLygVraRQTpIo0jJmM6tTB/M1eT0N0xwPxzJaVo62gsTXLXhegGJnWVcxDLqgki
	 D++72U+rItdcDn8qs0ho1Hn8Bgq014HmtXXKbCRRZ9gj9SNFfnHrw0prLK4OTSnSxQf32
	 X28tVy4TW9KSgN3jJmQL1s/Guud+z6keTUcwEofICZQ63KQCyAtIW/2sy58YKn6NWwU1z
	 50kW8jiZDpxD33Xj3mHi/kPT2/YxcRpu0SuKF/8zMM73wizNZZ3PsplY4VFtIn7yOqa3C
	 2MpKFrTPNBdeyOl0kawgWa1xJ+zk9IBgyq2sxU+7iZ6xg15qRJOGoBTP2iJWGyhLUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570183;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=VxgpRvMbcv6qJeLeo7B48rUim7UFlkQ3LNiC3OI9B+I=;
	b=TX4Crc2MO/Y2zDJqZOj44krmEkmFo+++L5xtM5CUFjiqSYejDK3v12QkQZCFTCVpq8me
	 2ezTuAOSxfkzbZJdueS9TojPHNEANa6pI/rYGVPmdPdzSd/2iL/pW/G3sLIXjOiEfxgKh
	 grSEYgp3vR7VK/RxbGVdNDfVzdd0NcnHqbFNhxQP+/6bUZS91rLr0Vci1VVsZHVMnMGbu
	 ouamJPyQxwoLUpepoRXkBe7fCEL9bOXUIjEcCTYDMPKimwPXDeb1Hvecyl5gfUGsIansT
	 ayDRXYYGSCrcXNJxQboYnlO+NrdiHHy9u4fkii18uiYNDQQ9D5Xz8YI3UHAlFjTUK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoZVBlK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C41606A326;
	Sun,  1 Nov 2026 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoZVBlK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A791F000C1;
	Sun,  1 Nov 2026 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570182;
	bh=VxgpRvMbcv6qJeLeo7B48rUim7UFlkQ3LNiC3OI9B+I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=LoZVBlK8XCaJk3d32r0MVm5RQFpUMuSJJGLmsbYPAcLzGHUbutg7uxgpx9HHCyK0W
	 en8oFH7CakHWCg3wpTAmPWorHWFe6LiK4WDriI/5hXk79VrhU89dwSKTmXgf2u2/ZL
	 ViccSxD02cjorYLb+ui/yLKsf6/3R6pOSYvtm2WKyI3O+6Z3mNKDQ5ebEDhemJyBs8
	 4UBAnHWF/DJhZ3RlJcD1Aapqo1Wnob67F3ddRRSs8f5XvklRava/tpSpKADb/gq2fH
	 XH0k0r6erMN3oO6vbMZ0s+5RM+7IH9o2G++5F3VKMN2SYGDQo82+NbGxb6WoLkIzS1
	 fGimYWiFm1s/A==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 22:56:18 +0100
Message-Id: <DMK7KD9A3LR1.25UWRP5SLKQDD@kernel.org>
Subject: Re: [PATCH] firmware_loader: Expose requested firmware names as
 sysfs entries
Cc: <linux-kernel@vger.kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Dave Airlie" <airlied@redhat.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, "Hans de Goede" <johannes.goede@oss.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <driver-core@lists.linux.dev>,
 <clabbe@baylibre.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261017142826.2668881-1-javierm@redhat.com>
In-Reply-To: <20261017142826.2668881-1-javierm@redhat.com>

(Cc: Corentin)

On Sat Oct 17, 2026 at 4:27 PM CEST, Javier Martinez Canillas wrote:
> Most initramfs image creation tools (e.g., dracut or initramfs-tools) hav=
e
> options to create initramfs images that are either generic or tailored to
> a running system. For example, dracut has the --host-only option for this=
.
>
> That option allows to have a smaller initramfs image which only contains =
a
> sub-set of the kernel modules, libraries, binaries and configuration data=
.
>
> One thing that can't be queried in a running system is the set of firmwar=
e
> names that were requested by the kernel to support the different devices.
>
> Let's expose this information as sysfs entries to allow initramfs creatio=
n
> tools to determine the set of firmware names that are needed by a system.
>
> On an AM625 BeaglePlay board, the following will be exposed through sysfs=
:
>
>   $ grep -H . /sys/class/firmware/requested*
>   /sys/class/firmware/requested0:powervr/rogue_33.15.11.3_v1.fw
>   /sys/class/firmware/requested1:ath3k-1.fw
>   /sys/class/firmware/requested2:regulatory.db
>   /sys/class/firmware/requested3:regulatory.db.p7s
>   /sys/class/firmware/requested4:ti-connectivity/wl1271-nvs.bin
>   /sys/class/firmware/requested5:ti-connectivity/wl18xx-conf.bin
>   /sys/class/firmware/requested6:ti-connectivity/wl18xx-fw-4.bin
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

This was discussed before in [1]. I rejected it back then because userspace=
 can
already collect this information through existing interfaces.

However, I can see how having a queryable history could simplify automated
tooling like dracut. Has this been discussed with the dracut maintainers, a=
nd is
there a concrete plan to use this interface?

[1] https://lore.kernel.org/all/20260715131325.26099-1-clabbe@baylibre.com/
