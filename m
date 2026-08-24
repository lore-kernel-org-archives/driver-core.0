Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC43B38B8
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555285; cv=none; b=Odpk8UkOT+bAC6lATNudOQ+pNaUCxL3MbULPu/ADDLsXqKXr91R/saWdloCHtKEH7hF+9iQxU1gwbL7WIvfmeoEatmVYCyrv81r/mqptoTWeRSS73SdURCCq2GxKQ3Xipufu7vgj+gQUx5pp76lBSBfj3VR/DW/xzW5aAxjexwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555285; c=relaxed/simple;
	bh=x4rL5ImExVbtts1yUsvd8ch5wOjpj7kKHGp6To67FpY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=lAQjrCqh9xUgp3u4EdIS5KxDxpd9HuRChFgxgBR4N4jo3Q/dcZ7qUNqdUt+OZxqro6tq2G4PAS6lC9avXncSnE7ZTwXyqywPFJLxLaT8GSiljm/gY1st//6wUoBYem6iPo8jOUQmwzl5PiVgngNdAOBvXFZyda5d/mkgCVIc94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ad778bacbeso6640182b6e.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 00:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555282; x=1788160082;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EUUfvmNuIgThKE5lRxB1UzJ6d0ZtkkURrgwbNo1SwnA=;
        b=L6GzolK48aX133jG7a2xlfkLXoR/ShhE/9EZcNY8S6y7i9/OmmpYd7C3CMl4z4Bgmb
         sFaQ0V2lh7P61znr94MCEu9Rb4MCAnEnUkN7l6VOEzUehcxYfhCyh5xLZZWkO9uDz4SR
         PcBl8afETlPUovcLEx4CrFGu7M0pFqELmZ/jSMofGF6ec6UZ01NF8y7axNx4h4ikQ+bY
         ScYb26tnqWILNAGsrsVQQLjGuVbRv527SvxhFsuT8zTRBkcLvcZOjUNvVvfsgmZMTaaw
         PNVxFpMCTfLRCecG9Wz5mB9SP5HK+AFKgoh6AYCR/GWDIQN15h8q6s2YsuLPS+4fHq/s
         jqdg==
X-Forwarded-Encrypted: i=1; AHgh+Rpm5uw41HJjnawX5A4ZVHIQeQJiBH/KYa/l9B9YE9el/+dkDpqhs+lVLYWeB6LBoZmMIz0CeQCqYP47ww==@lists.linux.dev
X-Gm-Message-State: AFuF++msVIkEj7NWVuuPeeuqfagiJc7/on0hZCKuH02dPGpp3RNCZjsZ
	G/b5CK4aYX4oF9xtmEqBakIJBrsTSNMrWmL8PCe4LAjUhbsgcDzl1XDBQmJuPaiThgVG71FXome
	MM/tmosKwAGerK+PykDfg0QMaDRujY9yciTSUj7tCwWMuzrkLfK5CbpcUTTQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6905:b0:4a4:c12:46f6 with SMTP id
 5614622812f47-4b2ef1db8c7mr30090148b6e.2.1787555282610; Mon, 24 Aug 2026
 00:08:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 00:08:02 -0700
In-Reply-To: <20260824070748.96585-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bedd2.dbb3a75c.13dd47.0064.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
From: syzbot <syzbot+d164947c037324221043@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com
Cc: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test upstream

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

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
