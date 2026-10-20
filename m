Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500633;
	b=fSxxmGa7WK4llaflv+F16NfgUIpqIExGOhMuoA0sXjDS3X2cf9Qw+grM8gUHPH/cZ6bd
	 kuFLZvi68IKD45ohOndB5Il1oQAjCqKVKPGb+tuxoagayqtLlJeIJoLXnfjo+Olb1PVPK
	 I4tl/66e+xHOwculbu371/xNYvA475tYTPVNqjxOU5k6rpQXrXZGZBJgphWHfqU8anaRE
	 MlRLDNJq9QyYYtBcCDGc3U0pG6ITBQ7MnU7GX02S4taV6GjwLtsMK+ddQCLL7xxi67/Ks
	 fRsnDofQWFGk4wzrc6cXQyYhzatEYVQscqXG/iO4U+YD+dCW4YweCt8KFaxTVOFiJ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500633;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=KpSvEb1ZmSOewVyzZaYexwDFI9NVYIxSu0bLN4vULYs=;
	b=CoTChkuRRgW/9a99w4BvITgnFXeKii1BboadIotWSc/FWPwvV3+to4aJkNNx/ftQMk+8
	 5r/xYgVrO12xhbqbb5iRo0zvEcsncwY1YTKDiRfVtlP8AYN2YcowQA4UDSfWW9f8fJF1w
	 BZh+blsNnhVYA99q83K8sHhxlxEG2LdNm4kJgHwOmukxKlfPcBhaKlWTclD3dN0+Ex0t3
	 YiBUryhF8IMtVLQwdYoWVF+1ub0etFA6oxuPAB6xY9nMSM/OEr/oeVvrP/+tPYI78DLRu
	 36zOEcmU92BVe5twP5K/YLskt9W0pfz3syVO8xf6ngKD6t6yY+kvXYsNhQM496INNlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b="C+/fZsuX";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Srk91qOQ;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F9606A32E
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=C+/fZsuX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Srk91qOQ
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 035FE140012E
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 08:50:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 20 Oct 2026 08:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792500631;
	 x=1792587031; bh=KpSvEb1ZmSOewVyzZaYexwDFI9NVYIxSu0bLN4vULYs=; b=
	C+/fZsuXU060k6/s7dA9jM6XcTcVilUWUX/jyaYNcv9MYe0Tgr5eJjpQPogb6sWb
	+QV1ajue5HvpKe8PiM8lXKvMYzqXq+XeXzC6crJhUvs88iVCUsHFQsc4+TDW2ZQc
	YYJA22LOvnYmjYIkA3K5NhHa46P8sfvW5sigl3ucojRtEYhYfIcrsqF1g30liTmh
	WnjUeufI5/i4Vp0HmsH/wHTRtrjKitcnmzHdWgDZ8MXGKfTtXCd+ft0LQ5+xGlxt
	iYdhNvDPr8Fp0Mk5e2xXq4QF2/RrOOCd6JG/f7kAQWNbOEJGQ0YEuf5tLGsApngC
	fYvPE8jcEmr/piJ6kH8bpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792500631; x=
	1792587031; bh=KpSvEb1ZmSOewVyzZaYexwDFI9NVYIxSu0bLN4vULYs=; b=S
	rk91qOQR8BrawTth/rYIaPGAJJxaYRjeDgW61xfDD/b9UfbUcSe0iJV7okQYUW49
	RZcKrRxidtW3s2bqWte5e7ECqbFcExp0577D+4uCsMySG4ay/5r5tMXgeLveRcso
	0xhhuR6CxqFQ4LX5c7IvhdQvRMd7jFieqOM8jDyILeM419C6aEwKjVhzI/Hp8esy
	MS9bY2mrtC+iaRDo+PkOkPb/tjJjPvLeI0MrdywixPxA1cbtaBVr3kWp/BHEanwK
	6ia6UX58DI5Z3Jp8gGzF2gxZwqsuJm+OX4B6rgDsV3r25VOBxHXAyh631ryc7Kix
	RK2xirDmOwwM++SLryC8A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792500631; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGRyaXZlci1jb3JlQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:CxcIOGOz8lfjjcXpgt2J0zB3Esx4X5kHMhy/PBdC2RVigrH
	WVk7T1SZO3PIV+x5IhWCrbTDM37bwUmem/C0klPvfQ8ciQndgIoIIOeWtgE/zYZ+
	hSY1lVYnLYVk5ec6Iw+o3H9x8PioEN1faDPWlcZOPYRcvS/jebB6udkHWW1XAMM5
	5XS+dkUF1NlkQBuG114WplsIzztTVqw+CL6QJRDtJMHt7RPUGHTV7H2cV+XwTpWB
	Rw6pfyVGP9Fs2GC+Gso6Agk1rTablvZV/i124Bb2zk+J2dN5kycJKbZtIV3mXviD
	kEW7NrAyAZ2KlB6bJYjub0oe5acrCnssMvJA8lw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:s2UGIG31dVFUg3IePb3OGKYWRiFAu1bRFyBtld4V9rk=:fCMs0Pv52oKfJdphB7XHmJehRsKvOrbbtcXx2K/iuPU=;
X-ME-Sender: <xms:lmPXaqvm6TsRdD7Rk8n7lXyo4RcWWU07K9mGyQsghorgzAJhk-6U1A>
    <xme:lmPXaojO5_BmGqNx20cIDnR7yTyjvi3KrpAE4SdPxp5RbX8QBU0UBhKKDBts3z4m1
    jAVdosNltlNp8EkvIYEQ-uAdnrbJ17u9wIp3dIeV3iWACVXqkLQq6Q1>
X-ME-Received: <xmr:lmPXau18DTCQ3SlZ1PG7G4DI6j3kQono1KoGjwaSQSG_KhfRdscYMwwaWyZrMPVgfOsoDrnJ1nx3a-DIaUrECO9I>
X-ME-Proxy-Cause: dmFkZTE2Du0we4KvtkwYGASTx0hsJNnuyBM3jUnEi/7RiemtGh+Gi0SLRw0/E5muq2rj5U
    BDAFL3o8mLH4+ktrQxfXyDWU5V/1tUk4UxTY4LeN0jAH8Zb/xWk9hzgwE2ZDxDluGf6Hrv
    RSxQxazp/9a0nqUgmKSSDk9xluPL/KvCZ4J/CrVBUdjkdifEVky7xSWmza9/3vURTQ8bvH
    CNzXdcwkDR7FT2ENYBkIxO0hK0srKpVTmaqskyiHfdL8bY+hToKretRYCrDogijKG86zLj
    m94QHMmk6HCu7iMtfNc88kpN+Q2Xc7SESlfdfmTg3Q8ATafFxKkvtSmzVxxfvK4xw3N6eC
    oBmVmuvYx9GCYkb6t0IixCLfUJKcOkZ0vVcG6V5HT7viNYzwheW8pnMwIB46hqQmLstf/l
    4j7O2XSKEj/lqlBm/K9j6SsKpawo1L75ZIWV5yTmkSjRLqOQKFnqddXcPELFJND9rTQJnu
    yTBTCPpWYjWzeQCbLrhYIdDzKjygdPMdLi9lmEE/vLVnFZ8z9IHqixRn9NnA8LAPd43Osz
    1dmcVr52wuCiFY0BS1MgxHGz1k4Y5rSqToCO+fs4DL+P5rciXnuu5N7b/Q9Y4wYqRE5IuG
    cCt3/EAtOhTZS8TlOST85YLRfLBMiauEeOYhjMsavRkk0lE3RY82/+VWskdQ
X-ME-Proxy: <xmx:lmPXag-eWWXNxbItODDt9kzZIknDUPOuxeVjmHg6Akm_2rXQZpkWrw>
    <xmx:lmPXakPN1bkDIfsF-QIkjDZHkqAl5qkO5Bn7LmBQ9PR3w6YOpDEX8g>
    <xmx:lmPXasBO53G1DjDOsrA94AueZWKWqMYm1a7BgA3221no_14u2VJwqQ>
    <xmx:lmPXauPcxJ-yrGxSHB4C6kpDfaKjq32eSqxw0_ZP2fWRV-3Q5g6rEw>
    <xmx:l2PXakcnVJ8i7xP0jAilcp_hwDF8i58YOhPIozmeGkyM1U8svR6Hm1w9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 08:50:25 -0400 (EDT)
Date: Tue, 20 Oct 2026 21:50:22 +0900 (JST)
Message-Id: <20261020.215022.576606933901583722.tomo@flapping.org>
To: samitolvanen@google.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, abdiel.janulgue@gmail.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for
 hrtimer_restart
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
	<20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 23:34:38 +0000
Sami Tolvanen <samitolvanen@google.com> wrote:

> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
> 
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  rust/bindgen_parameters     | 2 ++
>  rust/kernel/time/hrtimer.rs | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)

Tested the hrtimer doctests on x86_64 QEMU with CONFIG_CFI=y. Without
this patch they hit a CFI failure in __hrtimer_run_queues, and with it
they pass.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Tested-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
