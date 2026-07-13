Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB569305679
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954800; cv=pass; b=tFiI0fpMKzEkLcL7abTT3C4WKHBLQF+i5mESZ3vMENgOCHP4JNnC9PIcH6kkEiJ9wphdgJfmS5AlE4MbSyxmVNsOme6zIuyHFrS/7jt/ogHKtYd0eZKMIoPRGiUJvNCQimWlWwwAZMekOsyml7lx3ik2yVOl73EU0dRtuQLzNrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954800; c=relaxed/simple;
	bh=lWQl+VufSXM7g9eE3mxqPdqkH2AsnKinxaF4b/PoERQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5MqKDbKV+7pUYdzh4J3o2UwgZiyERfaLUih7Vfo7JhZA0il8RvCIugs5gutXgSdLNaLAsRUDMnIkpWHKlKE51g1uaI1SV9CWgh/pAACrqcH7H0FEM9J912pGcnxX9cTZOsqzfWGxJ5Np5wlMwjqQtQUTFQJSC5lpscyW4X4jmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qG6fedn+; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qG6fedn+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8454160043aso3223127b3a.3
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783954799; cv=none;
        d=google.com; s=arc-20260327;
        b=b5VQwDYxKCHm2tSs3mk4sJaxoW0UL0kTOYvX/Y7eh+2h2kN02ezLCcm44DS5N9S5z4
         z+Lx0px7HjDpgxU0oYFYuaqajZ19/rx9dKmuHIT//E6sjqkIA0XVDFg+EzyxhepnBMtV
         MHQ18/BV2v7szgXF2btxi8v6klF9OBvPWxYH5+Lf+2TubsENJbGfQiPHHLNU5VaDiiB9
         SI5hJOyuQ8scFQwqmIrS/WDjjcUbvah0OLhnZBpcpw/8aGGJoODxX4s3cOhWIG3k7Ij9
         Z84c+Znho1OXKbdPZexCVpwfmJAwSMcCUoRo15s9r9RlQI/8KAaIwjTL4BRzVIwQ885B
         fn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PZspWnWvlYF8zd4FVwuRbdjg+TDtQGuY0jbAAJc1SzU=;
        fh=d4titw7e1byC4N0vkwqboJMHp3WQnKKojNeAAlq8jEk=;
        b=RAgic3lo2cdKcdIe9n1Xp1Jctx1Qd0/ubyXmVW3OP86j4da0kJMlKJrDj/UncPy2mx
         zzuT5843QtZLJwJ3GKS1cMMRvbOw1mdJKu6DtJYJz29U2sNYmUt4gW7eQ4sMAda9zDAQ
         uARSvc03R0kiV6twzB7EFyVhr3e3AlQX/yIZ1rRr3nBIdKEuBr0rtUaSE1KIkONZV96B
         3DkAwOOL/72dq7t8OEQOh959l2EdU44tpEhXlBpqlQotJzsDre3LAehY0vUL1+De0RAU
         ua0LvYEJ59mX04vwAVNFxAJT1bOND/K6BeRJU2cyWV5J6tFpBo/qGLuRt4HpB11xVddH
         RaCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783954799; x=1784559599; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZspWnWvlYF8zd4FVwuRbdjg+TDtQGuY0jbAAJc1SzU=;
        b=qG6fedn+9FTBnO83MyakgbCSKLi1Pz8LHeO7bo0Irivc6ix87oYxib29z1xeI8V+Kl
         s1ax1kdOeJSU7/ZrzfDdKAxSDZllGFq9MkH1GFQWq/3Hi1jhsM5foh5TDD1WKp/02jzv
         IkJQYEwGNnHRrIHi7ARJcD/TZyWzwCvn+uRXt5pQ0WCEnr1oYbWFKgOmKSU4uUa2neGI
         yGD8BmizL/ogImAZ1Tl6qKNxpepQeDfLbyIUYRisBtvSt0qtauCvvdwiOsQ6jeGgIkYn
         N7YBCn7ndhb06E6i3L0xhMX4OPsXWE2WRaW1SEZpdodCftV1DMlXXq+LHvHhNYaeVguX
         pvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954799; x=1784559599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PZspWnWvlYF8zd4FVwuRbdjg+TDtQGuY0jbAAJc1SzU=;
        b=dpmPcP5Sn0tXZLaZAQyvWjG2hOO/bV/htyffBKeKVk+Fkb01GNfFOzIqX29DlDw8NX
         EimAUDMqCmPAaufAQOlcZqYsVpKRvLd0zk1jI0BLibdKRAWffloyp48C6KWB+6uH3fSQ
         PBb6Q+FjFgYKT9mjTD1+R/RQLZN6klhE0tfd/0nG7KVfFTsNjJlxEw5Wkr1VtpLuEhKt
         SsQRApCqt/F1VTFz1RMyV0/x1rpO6lasKESbT2e7+68ImwDeaRcIFvcSOCalQ6gWW5Uw
         QdaNspeayaDsxmwqlvhkOIcmLkAtPgDdzMQ4DwJWbDywvlii8gsJkZ2gXxUq3v4rFL2C
         6ZmA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6xOQ849DDJ/eD6w2u1+jThl3wohW3dxM6XKRXa+Xq1nS+h4ScpkdTNl5FyVE/qPXKJ8ULD3wqVB1j+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD//RCbix1Y/HpvTnzuXMpjjC4LwdYAWF5UsKw/6F6REUYyJkJ
	U1x5/s52YkjGTQRHjsGoxg31WsWyOE8jE5wfEOk8pofuYkizoASF46hTeKSxRlNT9CD5LXJxkTJ
	kwdXmcthkOo6eWOa8D/aPegQ0dt9C6j2d0HDtsYA=
X-Gm-Gg: AfdE7ckGUkbjb1Q9bd1tMLN83IcE193aYoks964ZJbI99j8o9tAYZYH3yXBBI9ZE+xj
	VIY7mnqCioTpClMRP+v10idXLMFBj7xB8Y7TpAdiR5AJsubh2nr+LvvXwu9eunDrKZkdB0VXEoV
	vjMJh77Z+2fE8SBX6g8NZ2cthn6Rie9yT1cXuOfkAXnluD/XHMbHBNdSnIO7nX+FS31ae8xg9Yr
	/wpsyEgZVRQivP7wQLcq7sWLR494oDLM3pPJ7WbhqroY5GMANTA6cZO31a//uYla1EpJNlVwqlq
	jEiO3dEou2MkkQDK3OsVLUGhaDAEkeDmZe58zush0J7qha6L3rmdw78ypJAovA==
X-Received: by 2002:a05:6a00:3388:b0:848:420a:9cd5 with SMTP id
 d2e1a72fcca58-8488974a28amr9373881b3a.53.1783954799006; Mon, 13 Jul 2026
 07:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713073059.47914-1-phucduc.bui@gmail.com> <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com> <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk>
In-Reply-To: <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 21:59:46 +0700
X-Gm-Features: AVVi8CeTQufDThILyDlUHXLqCf3pEyPE7cxq1t1oJy6MsuzwDd-aR7X1ENHF8tA
Message-ID: <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging registers
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the clarification.

>
> Yes, calling regcache_sync() with the cache enabled is not particularly
> sensible - it basically exists to put all the changes made while a
> device was in cache only mode (including due to suspend which is the
> main case for that) onto the device.

That was actually my understanding as well. Initially, I was considering a
patch that would make it unnecessary to explicitly call
regcache_cache_only(map, true) again when regcache_sync() fails.

The idea was roughly:
1. check cache_only at the beginning of regcache_sync(), and if it is
    already true, emit a warning and return immediately;
2.  if regcache_sync() fails, automatically restore cache_only = true
     before returning.

However, after reviewing the existing users of regcache_sync(), I found
that there are several drivers that call regcache_sync() without first calling
regcache_cache_only(map, false). That made me think such a change
could break existing users, so I decided not to pursue that approach.

If the intended usage is indeed that regcache_cache_only(map, false) should
always be set before regcache_sync() is ever used, then I'm happy to revisit
this approach and also prepare follow-up patches for the drivers that don't
currently follow that pattern.

I'd appreciate your thoughts on whether that would be the right direction.

Best regards,
Phuc
