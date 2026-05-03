Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236D19C553;
	Sun,  3 May 2026 05:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777784891; cv=none; b=UFZg+MrO/HSrpqjs+zUwwiGQMgJio7t1HxjMArQgCicnVi7nz67WwdJ/Ka7kPzXwUlhucqx/2Vd1J5VO90L0C2btLWdN2kw/qdCgQgKNS67Nd4kn7YRcHp9s86aUWs4Nq3OVL6YS9FIiiRRK+st7AdzNyIN1ZNBbJ0lbGnw1RCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777784891; c=relaxed/simple;
	bh=1x4dKUhS1LC7w6XIgtS8XBsYKKAfyPDc7z7XbvhsipI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoQf2+hS61z2dGXREx2uqy8hCnr1dv/bCPETDWXNBor9urzJz05rlWHvGrv4CUvBtwS0d4qJ8jfupuLFKyaaW4jOaz90KnxjkJGOfx2seAOYiGl4L2YpT58khJgjClp5F+tKtKmKmcrVQsfKyzJljwUFvc2lXlfKTq8Regy2AWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUCVpfcc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUCVpfcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1940C2BCB4;
	Sun,  3 May 2026 05:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777784891;
	bh=1x4dKUhS1LC7w6XIgtS8XBsYKKAfyPDc7z7XbvhsipI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUCVpfccr6cQUeJPBKaluyz11beIzsK1PUUWJQr2V3V04EHONGlvVXbBLV95hzsJp
	 KkEsRKW3ZJqoNk6WnABBzhe7NKtKztJXDIvoh3N9yFVlKg50h3LK4AD+jjauHmeoq5
	 aH4gUf0Wk91o6cy9+cGfiYrqCQJWoxVQJPP38DjMsNPdEm8TzIlk76hZ+ydCQYBeT6
	 gvST3ldq3DN64dqjvHRYDJ/8gpiu8PNJ766L1b8ELXseS+kFYJQ4WXfjHCjrxjU5F4
	 RYiE4xfoRfqugc5unHT4Obt3ZlbhntIigXGsPEeExgq0lNYPSTw5zrziP8N+ndqwD+
	 jFcNsopS6qIKg==
From: William Breathitt Gray <wbg@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: switch to dynamic root device
Date: Sun,  3 May 2026 14:08:00 +0900
Message-ID: <20260503050801.427989-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424102400.2615677-1-johan@kernel.org>
References: <20260424102400.2615677-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=wbg@kernel.org; h=from:subject; bh=1x4dKUhS1LC7w6XIgtS8XBsYKKAfyPDc7z7XbvhsipI=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJnfbqgtNzwVt9Aicnp7z5KjPdYmCxKziu+83zb15bspL Nwt9c/6OkpZGMS4GGTFFFl6zc/efXBJVePHi/nbYOawMoEMYeDiFICJHP/M8L+0qOjvmq8/WBUj 7P5m37A32bjH0WFe+hNDM5kjm7bY+nxm+B/vJHqwjqFo6TnOuCYhIa/IhGn9V7darDuyM+Wqjcs 0T0YA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Fri, Apr 24, 2026 at 12:24:00PM +0200, Johan Hovold wrote:
> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function is
> ever freed.
> 
> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
> 
> Note that this also fixes a reference leak in case device_register()
> fails which may be flagged by static checkers.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Hi Johan,

Would you resend with a Fixes tag and CC stable@vger.kernel.org so we
can get this patch picked up in the stable trees as well?

Thanks,

William Breathitt Gray
