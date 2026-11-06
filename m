Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955025;
	b=sU9qcsbWu99cV+hBv8vRm5ZJgGa9oMeyCABVyGJw9wV167VaUk66uQKqmZ4VaqLQqsOg
	 QV6lhAc8/3/3VDCb0GWpWXZkv9rI0zc7fokueKt1UefDotIeVb5HDgTUqULm1CvOGIaH3
	 jxjQwIq8TYHlMKP3YJBJuxrfwNq+5kD86DwgbcvLsGFCZSswqenoc/Y9VayPYIHdZhPIy
	 Vwt60ENkr93MqScFXed9vaM6nhHsnQobwDCUDLTP859e+gm7jauNJBFX/9D3ocdV6iwc3
	 3eEfcyJB0oAKI/pM4GPJlKjlqPQA3rdwbNFXSQJ7fx3enE91rCCmNYw7YyE7qax2v+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955025;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4KseLiEBWMKMKEx4omaKpJSqCgu67BaInGBjJdgTfdM=;
	b=4QERjJ/QsDInX5tGNPEOAQcs7hMWH0gqIv9pQPYeY0oTqsd5TErQbYRxc2KKLa8/VUtf
	 Zc2SOPJU90xnetEHrJJ+3y5Akg2lnjDtpNxdoEWevc6Yl6vOvLV5gWlvrqpS/6O7FoP8G
	 iVfC72AjGYAAh9BOto7kAsSKjnaZjqMpHFtjL/QXfx/FT9zPgcwGEmJh+zUU+kFcwpnKH
	 /9UtzhsObP4ezyNsFZ5iaTRX5a6UGPEdwMnwZDFOPAJkMFe8ojUCL70/s04ggHkHetHhv
	 YKNevXuSb8mBpgmKJFk0ul0mFbJZa71nhuThnnWFfKNv1Jg/l8OsoCVOPQXPcAPdBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d9ZLa/JG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA2606A331;
	Fri,  6 Nov 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d9ZLa/JG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771331F0089F;
	Fri,  6 Nov 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955025;
	bh=4KseLiEBWMKMKEx4omaKpJSqCgu67BaInGBjJdgTfdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d9ZLa/JGZT6or8tOKU8/O3nPYCiPkCACpZUlioB89wkfa7M18Ke/75hB8gUisOFoL
	 LtBjQijVcSaJfZtivfsR+SYheoXqCPqJiHSz3x4TecmILaqEgrxIl3bZxpnW77Ga0r
	 vNLpam8s3DvDVuyw6sxS3M+ZiNjMdybsglCyNf+9Ilo57X2hzNKJFBUS7Elr4rWPh4
	 JccxbKca5uA1e6WRMPnNNUTr4Y4JJ0VO1N5rFzGgAG/dSuHWWO+clk7Lj9vwxonKZK
	 QSX10IvIDyJn8G14IBD/TQAhdaqQiQ8TG1YfKDFhC48bkuck+KcPBHtfjphQHFIRpS
	 bAX/VBk6FQ/og==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xPFeQ-00000008NuF-38Yh;
	Fri, 06 Nov 2026 09:50:22 +0100
Date: Fri, 6 Nov 2026 09:50:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
Message-ID: <au2UzljzfMaiL7F6@hovoldconsulting.com>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
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
In-Reply-To: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>

[ +CC: Saravana ]

On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> fw_devlink detects and relaxes dependency cycles automatically, so this
> is not an error condition requiring user action. On complex DT
> topologies (e.g. CoreSight), this message can fire for many node
> pairs and adds noise to the boot log, even though it's primarily
> useful for debugging. Switch pr_info() to pr_debug() so it stays
> available via dynamic debug when actually needed, without cluttering
> default boot logs.
> 
> For example, on sm8750 this produces 125 such lines in the boot log in
> total, 80 of which are CoreSight-related, e.g.:
> 
> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

I reported this elsewhere a while back:

	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/

Are you sure it's not the coresight bindings that should be fixed?

Johan
