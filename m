Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66976401484
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659968; cv=none; b=l0iy9z7wDIBzXxD7FJlbkP442gIjTi867pLLE4Efx75yaS/EA38a4oTbxRCNNuiWsYDfXV/l6a9gWFI8u4WZK3ALNXUv6DOaDqWh7v5/N2LKOWR3wvYniFgt3Y/HTWVUu7x5kT+Xx3uXkwARWizcmxKNk4Byg+RYXhQ2yiH0/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659968; c=relaxed/simple;
	bh=Kf99QFy9f1I/NiSZI0pc3DJ4Jyqx3g9G1t6FUsK6oI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRF5BpxQE9GW0cHJeKvDsNgHijkKvcPinw54um7RSV8LzSbUBDPVXnHODTFN4EPSUk94nRCdKC+PJsHeKhRh3v8oGp2JsP8sFrlymsYLH5SKZ5NqJD24bQR6S6Y6Lb3aXBRTmNvik73chHtUP7SrploihRKisvzgEgxWU5o1dwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNb+INmo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNb+INmo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-480033bdcf4so2220941f8f.2
        for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 05:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659955; x=1788264755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2ev1Vdo7Abjt/mXhpuykTn4fXoQEZN9V9XBnPVfL+c=;
        b=oNb+INmow1zYvPT6jNcTzlP2hYEwTqbh25Mdq/c/vh16XDa0hAlwyvxD1VBYkVLFDP
         CGqqgleja4ATgfMecpPTD9iT6oYMXbq7bxQwO+oCezSRGjDzsKECurhdl/wgi0CV/gTc
         ya6X0qlSDiIlL+htGPHcUNulbGm8sqzD+nwvIpyvpIaAMH+N6b38yT9+nraPXAlJt8Hh
         kgQvZbhNSf2kS+i7h8Q5ayqZsyBzHzm66KG5d+tI/HwIC0Mc/rCJVPomc2QnInXruq2X
         3EJvnloEocgbL5ulXqU6qXaqHdzg9jmR+8VbyVUMHWw7rZ3boL4ggBiZuAnb60jloM82
         Q0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659955; x=1788264755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2ev1Vdo7Abjt/mXhpuykTn4fXoQEZN9V9XBnPVfL+c=;
        b=kVrIreMEDfORoMkUNhJgxhoYzlITpZXOJQPFYnZ0AuXC5jqKA38lhQF8xI+72IUTOh
         eJnrORzJlZVke4P2wm+k6aWRusGekz6Yb2Miu5Q9edUqcuybjkqzVQrutPU0ou2LnwuO
         gHnRVoVRSfWI7eRXKTP7j8ef3fNfYsDsh/vh8dpkaq4T8IS6kE9Fp9S6u5ndl7AdNwrL
         vJDGuo/M8c/r5lAUS5v3W8+bT+okknFK7qER+QfWFiVIBocdlQwZib5iG4TnCg/iGd6n
         LKTArPmUTkeraCco7kWYHFWKMJEXbfJZndtPp7Rfwk/ofQ2yox8RcluqGVdqdyVDXYVe
         4/2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7VpcWpf8JaahVOZlS6D9crsehLeWUHzeKiVGEgLlHs8bUpwV62ULKwLSnAXAvokHpMru1OvSg9AR8sQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kLyaAvbFXNF0deBwoLciGupmApABPFp3DeUm75Cq9iC8RzUaU8
	+KNVRqHhSAjzmHjRy82GQXx24SteOW5lhDRq383/OGSkytBpNOZV0Lee
X-Gm-Gg: AR+sD10BNOqN0YVAnYbaMvyokzglGCMP8gzy+yhhQ8xLch5IqS3fWvuBtFuhwEsSKnE
	cClDTpZe80PqxaQYBBlgvCv8xXA3Y/qEPt9r6dDrG2Z8FmZmRvuqw0SkXiPG2vKQ+E+d02MWJsF
	t5cUhbz2BNaWSldUWQ/VBUe4A/OMmr7wdSDRPeChWY42WPBECOfOD+Rynza2h5RgchiEJ/tggPB
	D7iwi8BgZ52WqmNO1CdGJiNj0d4t+AW0PUm0yUdrmvIl7xtwuGEamdj9K59UPN67A1j8M0Q2N4a
	KTliDrRsu28yUAjzogReAsp3z3LHD1xsKxF0P67M/iSnj/RBpZ3QG+hrwgIGfIxD2iBqCNFkmgc
	TUOhljDtYI2s51287q3GNBxuqZ6LEl7IGYh9j/TsyL2UvBTCachNFm1NtA2vebSblUkroXZtt6c
	jHcbBZQAIDNUFhmU3DuFWW86gZWIT8f0SoC+d08JV8eSqEOEgyW+r9gKEDToCU+TfeQfVHGCWyE
	ysE7fudks6yHA==
X-Received: by 2002:a05:6000:1acb:b0:480:c5:d635 with SMTP id ffacd0b85a97d-482c80ae782mr26868618f8f.0.1787659955325;
        Tue, 25 Aug 2026 05:12:35 -0700 (PDT)
Received: from fedora ([80.87.19.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482df980037sm885277f8f.20.2026.08.25.05.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:12:34 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:12:33 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 RESEND] kobject: fix out-of-bounds access in
 kobject_action_type()
Message-ID: <ao2GsVJ6KSO7iMG7@fedora>
References: <2026082518-swinging-wildfowl-9c19@gregkh>
 <20260825070525.76409-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825070525.76409-1-stitch@zju.edu.cn>

On Tue, Aug 25, 2026 at 03:05:25PM +0800, Jiacheng Xu wrote:
> kobject_action_type() uses the position of the first space in the input
> as the length of the uevent action. It then checks the byte at that
> position in the corresponding action string.
> 
> An embedded NUL byte can make strncmp() report a match while
> count_first is already greater than the actual length of the action
> string. For example, the input "bind\0 ..." makes the parser access
> kobject_actions[KOBJ_BIND][5], which is beyond the end of the "bind"
> string.
> 
> Use strlen() to verify that the input action length exactly matches the
> known action string before accepting the match. This avoids indexing
> the action string with an out-of-bounds offset.

Sounds sensible to me. This doesn't seem like something anyone should
intentionally be doing, and I assume users won't care about the additional
minor overhead of strlen().

From what I can tell, this does change the behavior for actions with Nul
embedded strings from 'undefined' to 'expected to fail.' I think that's worth
mentioning in the commit log.

> Fixes: f36776fafbaa ("kobject: support passing in variables for synthetic uevents")

Also, it appears the pattern predates this commit, so definitely double
check that tag :)

> Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>

With those mentioned, feel free to add my tag:

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

> ---
>  lib/kobject_uevent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d2..b03562301bfe 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
>  	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
>  		if (strncmp(kobject_actions[action], buf, count_first) != 0)
>  			continue;
> -		if (kobject_actions[action][count_first] != '\0')
> +		if (strlen(kobject_actions[action]) != count_first)
>  			continue;
>  		if (args)
>  			*args = args_start;
> -- 
> 2.51.0
> 
