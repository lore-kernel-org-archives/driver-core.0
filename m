Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C417A2E8
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592780; cv=none; b=KrFjrioW1XFN3hBCWDgFbBYrVl8qAe1nQregcD+XsLUCaw0UH1UWa2mxfKfc81XTx9ZfUarBMlE10mzc9kwam7VpjxjZXkBPUQHl50jZnYdoOxgYmsV87TrHU5h83VrZI7IdikYtue69vNnhk8wwmmdDqGMIk4cooYf1IMwRNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592780; c=relaxed/simple;
	bh=V7KYSqz/skcAn5lVRP69O88rrf9TrwfMgaLkALozPz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCKDZTpHqMUaAIOe79+xptj6HNY/N00KWTRwYcu7nEMsd/jpD3iExRs22BMLz+aR2HTV6G8p8iIiqh+J3zS2uHF2k8pwXABD5FmkbGIL++YukWWo1xM9acFtUKvVwn42HfbZ7qi0eBwEn6R9G4xCglTS7Redj76TOC240MLfa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUa7m3Hk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUa7m3Hk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1750797f8f.3
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787592777; x=1788197577; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zV0NTeBKO5JcVkVtlyw5r1QfUqLHDCXaKLnG7rISrZI=;
        b=FUa7m3HkFswDeUO1dIVrY2dtl6jPSJXSv7k/NS+2IocIv69hbLgVdVtD1NAZdeRdN0
         9wagM1ALI/eoFzHHCJiz4P1/kWKr/PNx66Psb0ktsf8t3yRwQETatg/G8F2V3QSYceOB
         sNtTsYNO6OU0Qm78OjZNQo198HbjnQ0wHP8dg/SKAZ3KYn35lYKwEYOTsSySszXRVpz+
         X8FBEUxUn2TR4YRCYgCk4sXlPG/fjgBXbMszAKT6it6K0nsw9t6rTTjCjijeFk0tthub
         DFtbUD1220Sz3AUV1RcDnB++CPB7MVvHb0+HOIJ7BIBOwaP/wmvfg3An74G/DNlQmRja
         tH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787592777; x=1788197577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zV0NTeBKO5JcVkVtlyw5r1QfUqLHDCXaKLnG7rISrZI=;
        b=mXubeg8PYsDHiQFJlwUMtzjkGRm4q4xVYVzK8GKduFytnko2AOiFJ4efusSDNe5QAc
         ISzv8k8Q8z9xDfqmeAF7DHtWcoOTe9bMKuhjGACBvSK6ZXKT5Y1I9ed0qYND/04rYCHB
         uFhrc6t3KAkMNMbNQ18gnGxMzzukaeZ/kN33XDOIJgf5xZOnX2fqpM9dKhPgBhS60T6t
         Dyzs9IB1niM7Kn1kdpig0QePnRDUyrFmGsgohh4Xumgai1Ng78m7PY/Dqh2t4v12omxh
         Px2LImTqEdggGEVKoTs/jPJQmW77T3+qB45DvnYHq97AgurcxxMAU0vDmA/GbO9q7iHg
         FmYg==
X-Forwarded-Encrypted: i=1; AHgh+RpdO/dltG/BaHJCB4j+KENz45VxYrJtnBTqlw3HBRJzkotFNwSfYSGV0eb8sDifwyMLyhLCPsnxTDvq/A==@lists.linux.dev
X-Gm-Message-State: AFuF++npcl42ZDKdajYQ9BHX+m2TLVGLr5i2zRlzqQAywMWXTrBrjY6G
	mb4FllyPrQRyWfYRwLs97lufGIbiazEDjjvj/C4RSyvOIRmQnRzYGb8k
X-Gm-Gg: AR+sD11QGi3mQ9Z60WFrgMj8LpdB4B75NEhhSUVM050fUMxy/2n4L7G9P7kq3xT5yQp
	2yIozFHpLLdqayVjfpM8jRy27wRffZwQR+ENL7dj1jdihQRJsmk5LvzpF3KlgZgw6UY4+fqoyrF
	zNQvUd9tCIA9y2ytBce77JdXLeXNtE6S7ZX1uwkkQXSxy2I7xizERjo2xG3IyrDpQa4PLt6H1lJ
	9H0HoeevEDtM8fn1vbz0xFWRctCmAmfvo5/A5ETlciibmBuDJBkaQupzyLcQjwXETithQExPMP3
	EXf6uyM2J6n9JV52s3NPswi1RBK9Wb+Nm5KyAM2Ku7BjWUzn0t6YJPbpAmNwRQOHcj5QL9V8nce
	BVrT/V0vQFU7ni1N/WudCgeH+oe3CiIvTKehUs1KHNHPiREKQ8mbIu8JXZvZatg+Qf26UA/mOAB
	N59IvnUTAEt4wqOyoy+dZ/hmDV2TOl0JMLoUcU9wHcRkm2IKgiJjardIlBmAr+OiOsZwMre6Nc8
	Z9FqqiX/BCPmOSWDTGptdPqPA55zYVFK+EphcbizmSPAwYRbbnQ/uCFEYiCL8/Xi07hb4y/WUBH
	aV1o
X-Received: by 2002:a05:6000:4310:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-482c0b9dbf7mr35793035f8f.19.1787592776468;
        Mon, 24 Aug 2026 10:32:56 -0700 (PDT)
Received: from fedora (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69b7fsm9041048f8f.2.2026.08.24.10.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:32:56 -0700 (PDT)
Date: Mon, 24 Aug 2026 18:32:54 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] kobject: fix out-of-bounds read in action parser
Message-ID: <aoyARlxyR9c71H8Z@fedora>
References: <200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn>

I was looking at reviewing your patch. Unfortunately, it doesn't appear
to apply cleanly; I'm seeing:

Applying: kobject: fix out-of-bounds read in action parser
error: corrupt patch at .git/rebase-apply/patch:10
Patch failed at 0001 kobject: fix out-of-bounds read in action parser

It looks like sashiko failed to apply it as well[1]. Perhaps you should
reformat and resend?

On Tue, Aug 18, 2026 at 02:26:14PM +0800, Jiacheng Xu wrote:
> kobject_action_type() uses the position of the first space in the input
> as the length of the uevent action.  It then checks the byte at that
> position in the corresponding action string.
> 
> An embedded NUL byte can make strncmp() report a match while
> count_first is already greater than the actual length of the action
> string.  For example, the input "bind\0 ..." makes the parser access
> kobject_actions[KOBJ_BIND][5], which is beyond the end of the "bind"
> string.
> 
> Use strlen() to verify that the input action length exactly matches the
> known action string before accepting the match.  This avoids indexing
> the action string with an out-of-bounds offset.
> 
> Fixes: f36776fafbaa ("kobject: support passing in variables for synthetic uevents")
> Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
> ---
> lib/kobject_uevent.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d2..b03562301bfe 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
> for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
>         if (strncmp(kobject_actions[action], buf, count_first) != 0)
>                 continue;
> -             if (kobject_actions[action][count_first] != '\0')
> +             if (strlen(kobject_actions[action]) != count_first)
>                 continue;
>         if (args)
>                 *args = args_start;

[1] https://sashiko.dev/#/patchset/200d27f7.1471a.1a0138c92da.Coremail.stitch%40zju.edu.cn
