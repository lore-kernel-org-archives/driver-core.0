Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702434;
	b=0MZeydG09NBwTg5JzkFglqUzKt8MYzzBlwt3b5+toqHu90VTcvNSerssNyCR7ZwWfsAv
	 /9lpk5f08y/4xSizOGwmWFaIm0wfZNbm1uYyVzlICO1UFcV1TkT4P14M4hKAYuYEJElgD
	 NcgDUlyrSkmw58Olb84eU296pw3NFR2ruwaPXir0IMbG3e0fFFvihEXKNywQNDOUpJgCC
	 8QT81AhYMuhGIWLc0LAKTFB0LYk1U4z/j9VYD5g9E2YzhfisGc59MNyi/o+59txhXbfM7
	 a27luKM/34gJCmSPv+GKhENrHlgDKCkIydYDRDGo1+8/6iRx0xuYqRtP2XtdMrzDQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702434;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Lr7P20EKYjEc038PzFeqqTo97bfs0MoN03/QMxp4yHo=;
	b=Mq518jU5ySqyyjfdozDZULcydyl0hRNVyziYUqhPMspBF2nx7GlLCmn3KSm+o6NsGcSj
	 KH0aQzbTSEPdrlfjs8O3nP547Q6wXCoiuSMYemqCL+cai/aaiGrOJLLmmGyT62ogF2vJI
	 wCKL79RpUGlYdfuKK4dALb0TMj5SbGgqpmBj71G1qvdl8/gnKz8SscPhQ5z5HOAYp9+oK
	 KEAqWzCkhWqGE+NweWo3mKlX/VzahU65fxaOv7pmLZBM8rVVoAxMgRmzQhftkx1GHPLsU
	 +sCmbo1gZD9iZvQsJjY5uwzFi+vMhRvlm90++iqfgo4ojOn+7oNbEUo3KIJmXddQ9nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxZx66k+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D26606A31C
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxZx66k+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82501F000EE;
	Thu, 26 Nov 2026 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702433;
	bh=Lr7P20EKYjEc038PzFeqqTo97bfs0MoN03/QMxp4yHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxZx66k+i8LWpPMBqPYQY8K+SJT+xUnn3rJdbrk+s9IkgjePxz/FTlx1AOrufd/Vw
	 eXtiqdqK0UqJL5hCFcsIVQUF2qMycr1aEg137qR5NGiAzayhUd4pNj28JHB/is2KPD
	 t5AaGpMQ35AnfBQbNxQ+JHfx3kcU6N8X+fPL/KFTATxxyR38SCdGyn3U0z1og1Lzwx
	 yx+rTnO1U7bxATE7edM4kW4Xm5TmBPADMrNMnS3Ndf0JfvP04AA+t8mymPN/419YzJ
	 mHELHjU+Jf57rxDjDf6CW6/Zh4u8oB2VenGoaSkivouivqRPAbkOr7gIf+f7wPH3Ou
	 F6oou7JuKHfqA==
Date: Thu, 26 Nov 2026 14:13:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v4 0/4] arch_topology: Bunch of error patch related fixes
Message-ID: <20261126-kickass-idealistic-falcon-cd9fd9@sudeepholla>
References: <20261111100331.2945297-1-sudeep.holla@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111100331.2945297-1-sudeep.holla@kernel.org>

On Wed, Nov 11, 2026 at 10:03:27AM +0000, Sudeep Holla wrote:
> Hi Greg,
> 
> Hopefully no more issues get reported by sashiko. It all started with
> one issue[1] one patch and ended with 4 different issues so far. All of
> them are related to error path handling.
> 

Hi Greg,

Please queue this up for v7.5 when you start collecting patches for the
next cycle. Though they are fixes, not sure urgent for v7.4

-- 
Regards,
Sudeep
