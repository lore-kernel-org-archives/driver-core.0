Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917752C1594
	for <driver-core@lists.linux.dev>; Sat, 11 Jul 2026 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783807919; cv=none; b=uMOSBm4vrkqofaJWb7mzqlaC101ikFW2vQLkebNWykXWk+vT0/nV2RIUfQ2bL4DXqtGXhsK3Sl/nlRNRfCddAV5weJfkhs4/66NYpq+BKDYCyxf74V/vX0Xlth7zd0HAcjdoV93of+SGKvzZj4qivaf3NACyEI6lA5Rl2YIDz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783807919; c=relaxed/simple;
	bh=4Sn7R6YVdoHQ95dqj0ZspkmI8xnHHeUwvOuh8g27vj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWjdNLIhu6ckFGA7qlpHQ4i8VtU52Be70LfuNHeR/0/VsaiU/QTVY1UnZ1r0CI614fUb0sZjJhuUV9RDxRG1u4qi9Q+/UDHQu82gIJns97JyLzTqo2bkRJz5/J130x+PeeFCVH6vYf5Hg/C/LWPTlvwR3ZBR21aVFeFGqfriK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5puC7lR; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5puC7lR"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1439029a12.2
        for <driver-core@lists.linux.dev>; Sat, 11 Jul 2026 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783807917; x=1784412717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pe0jcb6EYD+fFbLyURVUHtob9a1cFR2K5bbV214XWLI=;
        b=n5puC7lRKwTpuZ2s9CR/ORSJlwEZsGJhCEypi7s061ryptdd/uMVqiwhfISU1t2xkq
         24p+Beog0iOIBB3oHSSUzh69UONYQe6ph2akKobef2byWRbPlej/+MJSlJqND6EJQqY/
         5+Z4EuPAaiwIwDfn4HlhOK5Mg8Il8TeBhDvDwCmGOTQiM+qnqRmDFsSXy69HNtWUrsaZ
         N3bZACc3Rb/clfwOwNPJGBLFhBrEKiKIqIP2noW7ediJDlqRaaM1oUgJkN/l1nX+bkQZ
         F52JHudPyPGOZ1XsDqFnMlQNMsY5v+YXTyY1QYQWq43ubdvaQGpe2dOifVFeE7sldScI
         egpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783807917; x=1784412717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe0jcb6EYD+fFbLyURVUHtob9a1cFR2K5bbV214XWLI=;
        b=hbEo4PA37Y/GpZBYciQJrjA+21tTQpczfYdwPe/jCSmJjbxLIvOeW8F8zh4Nb92dg5
         Rhfqaa2kuFN94thsykNLzROYFK2DLuqJgj1MoQdF9OevqC5PFhBwMuaP36SwKkTEo31I
         n0/FWjlB3gEtX4LaNshN//Rlm7wToFZu0oN4dPTwwE9ZLqG6GJGhBb6Mj6KSoMlcDEsg
         cKeYG1oxInRCQtcQn5a3u/qWjsS5ugUZyGl/RvBmqdJsXI7PdnHRrC3mvlSkN+ChRk8f
         8BnVWUW7wchn1wHMwrz7evUmcCDTBWjlnWYt1/v23BRzQ0IxPDXL3OXf5vUDMfmDPP77
         tL8g==
X-Gm-Message-State: AOJu0YzfKKAdJDLGKSTBqy0n/nwIF6UzZYRl/BxQuAghG4Nssye1elQ0
	fE1LKotICvDrNgkrd0eB4RZPSiuTofNyR+IRQC4Nl1+3OtnT8luMfuGA
X-Gm-Gg: AfdE7clcMqkP3EJlBMTEFgDfu0sUOidKysni+YB5I9mpnmArukbXAHHOG1F9QEdb7Mq
	jbWp/viZRfT3RhHgvyC8JNxbFpM+PvVJsPaZM2xlLmwkzNvgzJC0VowZuJjYqdUVggYwJgnSVzs
	YG5Rd6y1m9exoUAaJZYU6921egQC7KKcj8w0NkO2hTejkA5DHG6qQB79lzS4YnZ20w4j2zwa+2+
	UAeAMvG8u8Sq3EIkYBz0/DphFrOnnaKq9MKnfSfCKQesjZoVq4IByT9Pr3ukSpRgJPupUnJV4Av
	WivoMPi+84Nsf0CrufZoclVPJqkHfSVlof2CPuaVTXV0lfOCYhUwmkoAIDUnxfVccvdUyZR3Fns
	tCruCma8YV3pTVDDzTtoHgEhWZ6TQhnX43CsFP4nXjMtI1/vLIAD3YeygsZw8tnXj/TiCf2OjNr
	pHzUYz/oi3a7yNYfp82DzH4Tv+4rAaeJJMwuTAd+vY9EljHQM/MgTqeOQ1Pen+xvs=
X-Received: by 2002:a05:6a21:3995:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c1104e576fmr4101076637.33.1783807916929;
        Sat, 11 Jul 2026 15:11:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm14324115eec.23.2026.07.11.15.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 15:11:56 -0700 (PDT)
Date: Sat, 11 Jul 2026 15:11:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware
Message-ID: <alK_lhT0HOI7LXKT@google.com>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426043041.649202-1-dmitry.torokhov@gmail.com>

On Sat, Apr 25, 2026 at 09:30:38PM -0700, Dmitry Torokhov wrote:
> Currently, the builtin firmware loader allows 0-size firmware to be
> returned successfully to drivers. This differs from all other loading
> mechanisms (filesystem, sysfs fallback) which reject 0-byte files, and
> forces drivers to add boilerplate size checks.
> 
> Modify firmware_request_builtin() to reject 0-size firmware. This will
> also result in firmware loader falling back to other mechanisms if an
> empty built-in firmware is present.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Gentle ping on this and the next one...

>  drivers/base/firmware_loader/builtin/main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/base/firmware_loader/builtin/main.c b/drivers/base/firmware_loader/builtin/main.c
> index d36befebb1b9..1dcebe8e7f8e 100644
> --- a/drivers/base/firmware_loader/builtin/main.c
> +++ b/drivers/base/firmware_loader/builtin/main.c
> @@ -53,6 +53,8 @@ bool firmware_request_builtin(struct firmware *fw, const char *name)
>  
>  	for (b_fw = __start_builtin_fw; b_fw != __end_builtin_fw; b_fw++) {
>  		if (strcmp(name, b_fw->name) == 0) {
> +			if (b_fw->size == 0)
> +				return false;
>  			fw->size = b_fw->size;
>  			fw->data = b_fw->data;
>  			return true;

-- 
Dmitry
