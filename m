Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B74189B9
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.218.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270648; cv=none; b=GbqjZLbt/8152smvCTh4nly0bCkAkXiydGjvCyUV2zUX4uVy51JWNWveHzyuFM9EA8FZXL9+DrdYD+Rt6oX72qGV7hrAouyQyBoc9017rcaI+TKyiyHIxtngLuG6ngb5JjQyjR7T/afJfljqvxxyJLPxBbPaSXqi7qD9Sbt+Uh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270648; c=relaxed/simple;
	bh=oK/xA9gVMbI2vKHE5I6Vbh18NsrBzHCiAkSaKj73Mww=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/QMhG4cLIxW13SaeQm1DSOARI0q+NJ4m0774ack2hSyY2lksva8nxgNOlCzS84VRtqcP36KC1iV9eymmyKYD1h20oOlpWjSJUmXy1KlEDYRhCGCF1Ov1jDjV7pO3XGGvs0oeStJUEQA/TUGCewvuxKjF2KnzOUJKZzqAV2320A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net; spf=pass smtp.mailfrom=kaehlcke.net; dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b=hI6zYUEY; arc=none smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b="hI6zYUEY"
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E0A429415F2;
	Thu, 24 Sep 2026 17:23:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a251.dreamhost.com (100-100-64-102.trex-nlb.outbound.svc.cluster.local [100.100.64.102])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 971039407FB;
	Thu, 24 Sep 2026 17:23:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|matthias@kaehlcke.net
X-MailChannels-Auth-Id: dreamhost
X-Quick-Bubble: 5ccb675256e08514_1790270639729_550259935
X-MC-Loop-Signature: 1790270639729:3222096326
X-MC-Ingress-Time: 1790270639728
Received: from pdx1-sub0-mail-a251.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.64.102 (trex/8.0.2);
	Thu, 24 Sep 2026 17:23:59 +0000
Received: from bielski.sytes.net (unknown [79.117.203.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: matthias@kaehlcke.net)
	by pdx1-sub0-mail-a251.dreamhost.com (Postfix) with ESMTPSA id 4hrLKW1x34z1049;
	Thu, 24 Sep 2026 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaehlcke.net;
	s=dreamhost; t=1790270639;
	bh=oK/xA9gVMbI2vKHE5I6Vbh18NsrBzHCiAkSaKj73Mww=;
	h=Date:From:To:Subject:Content-Type;
	b=hI6zYUEYJ7jh3RACo1sEpEjZTEeIGgBBCUEDiBnxWxOh4qd73H14tMFPAiu9DKnOC
	 Uap4FB/xAddmxtoN6inSKbdVr/mi4LL9RmjG+Tk6+nHxzt1ZD0wcrIilxlpzF1Etdz
	 WZyo3YvlSA/ZpY8tJXUsKG4mlRfUiGDlzLWboX2n4xmeonku6W654h79m6ogaGJM5r
	 v/9VI7up29nkQ00iILGbmTtrlbPNe3P68KQL4sg37ENVq083dB8FFKKz0Meol8f/a4
	 byDaD+1uSa2v4IfftFSsKOLj+KRYQgjAMW9h0iswmI5wFSOPmS66CercPDFpdnudxS
	 YWh6OXX9CRgFg==
Received: by bielski.sytes.net (Postfix, from userid 1000)
	id 716C380E18; Thu, 24 Sep 2026 10:23:56 -0700 (PDT)
Date: Thu, 24 Sep 2026 19:23:56 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: debugfs: add primitive type bindings
Message-ID: <20260924172356.qut7abzafz7xwbqv@bielski>
Mail-Followup-To: Matthias Kaehlcke <matthias@kaehlcke.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9306c51f937e4bb4026e68d862b64b16f6894282.1790103860.git.matthias@kaehlcke.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9306c51f937e4bb4026e68d862b64b16f6894282.1790103860.git.matthias@kaehlcke.net>

El Tue, Sep 22, 2026 at 09:18:58PM +0200 Matthias Kaehlcke ha dit:

> Introduce `impl_debugfs_primitive!` to implement debugfs attribute
> creation for native Rust primitive types by wrapping C debugfs creation
> helpers.

I realized most of the functionality is already there, regular decimal
attributes can be created using Dir::read_write_file() or
Dir::read_only_file(), with 'data' being of a type like Atomic<u32>
or Mutex<u8>, similar to the 'counter' example in the sample driver.

Sorry for the noise :)
