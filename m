Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8143FD06
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588112; cv=pass; b=bjfVc/F1qg44YEZZQrgPuT1WNN8p4ROfZTasRiu0/fakMbkD0BErxOPxW+J+9H3FhCIFjcCAsjltvsQ/iy+3peiLZHbukE2n6KV9T0UzVsb9ptcIwetko4AKGgZ4nXArXvuRPCdSXsjh5+iwP3kOx9PrNEH1xettd/suUjVfeag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588112; c=relaxed/simple;
	bh=E4adBSqv7HljmC3Q1/9aM/vf3Vd3WWU+Kc0SjB4vLi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0d6HrSP0w33qOQqD1l2C6aGlZeWuNpMO3QckKyJUGzlY5ImO9zAMUb5C8GnzYOUu1IkzKK/VjH+xVDIwuhQlLrj9u60L85glTT13YcKkBLIwhbKA1J6e7zBCo1WPBiCejQ+2KgpSyBMz+ry8FsWotxj0OEHqKPUNCEs+xu3LkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=F57lkzX5; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="F57lkzX5"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-86382f10801so5342067b3.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 12:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588093; cv=none;
        d=google.com; s=arc-20260327;
        b=GZvjMer1Zq4x1/Q8Q+HDkJ/MF1184koqLvmVLez4RwjwvtlpDtbNLcxvaAk5cceNrB
         1MwaPUxtgcW7B5U43CYzP7sNrVnj4/BoV7cR8aNa2i/Uf27CQv5sR6eygt9QDfIo6ToF
         iLZZtZ2/jrjNg1pHoDcFYVfSC0b7Bw2EwsUBUPNEgmjeVdLb/zjb+EAmYMo9/ziJDXUB
         LcHK/JGBGDxvc0GPNLIQfa7AzfOyuy2KPM/u1rF1uJ13cnf0QZeMbVs4VkhHUsfatCsU
         Hm3DbnUiiMsMUuJ+ln4ievIatMg3UCco7USzWQXf0tfAGImja2yRhjtUU8PG4TfFS9yr
         F1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        fh=hDqz8yBAcmOEO6I0+Lk39OfCTjYUxOtP+tHMkMQ3Qrk=;
        b=mosg/upfoq0qVtGfYh5Fo3f+PU7UccN30nEzHFFVktATgUcPnl4ve7vWbMePvtvflU
         HGw0OisEegFV3l+oLa5WuB56nLmlJ89hZSyYxpg64yXpqkChzoi6y7DbAzBYCOMc4Enx
         OpRsuph3rOG7USGPOnJ6WtgJAtRyQ6UPcZ+npiNF5BB72vbc9t5kQIkn8jDHYL0Q13/k
         AZqq1eP4pDoNwo44BSkwRLUdIFS97mRcyfTyHstptWmhPkpc0t7zqseJ6Z/bl2+aL+Yr
         8zn854g32eeLN7GjjRGdLAUvL0I+jJDruxWL03vhNv/tnCbN7IAgNB/EmXYgwmnPDCcS
         /LwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789588093; x=1790192893; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        b=F57lkzX5AE1fqk0mEeLpdeB/VX4Dz9wtprvjTtwQJT7xH+CvR451pqLFjvzNv4a5v/
         I6qXf6ixOZI3dPhLA1IJeAUa1ssWoFu4K9ac97Gc4rchsUaQSZl0k2aCxXBihV41G3DA
         UGgso5oYAM9ZL0/oJmPfPVgyPkUtxvp6rSKY6Z8zvhX2xEkCZaWdMY4+z+51fNe039sn
         GJyfM7I6YP+vDHxSVj1Yh3eh5cKV0oolwft0SBMgHvd3/snESoR8JKa+tCSPfikuyFNK
         kz32/Xg0MQgtTGQ723si5jpE2tp3nqm+ZeYVGiS99g1rckR/Bm8qzPWHdQ+LSAWdmfkM
         wXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588093; x=1790192893;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        b=WX8wfDH8WQpPwYIdbChM/UfANQUkj0gbYu1p4+YP1+vlH3DkaZ1gdv7QxVB+MECMGo
         eP9vN+37XzoETPEmcepryZC2OAV1JIjsUAlOZUBTKabJRlPSKfGYwJoSmlP2b4546qcc
         usAp6tN1O5Jo0jfY0pDhxVUv07mqOrJ0ZYED4iGhUTQuviaIUxqYgFRD6mDDDkrCrlxd
         D1mU9ZV1T/JB+NdCxLFKzY/bwhOqah23WseKB+g2wg69A2+ZBnqW5lZm38CoYVJk/lQe
         2EwFjsRdfEAQYahWE9a7TvWmv65MTplaowyvY/zyMPxPuI8r7yXoaxDsFQGETzvMwMVC
         brTg==
X-Forwarded-Encrypted: i=1; AKwUvBycRsVv0K/vQjCmWERo9tThwQxBybtboIuZ55OWJnvg8yjQlrv3+JgZ6KalkOsSrUpXBA2fv++zQZYBYQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n0PWe8B1wWisu0oC57dPAK5aC6gBeZe9/JlZ8a8xB6JSnvZngb
	jQcmjVCX3wWq2LzBhYzqVpZfSJePYghyHPQfTnTDzrvLO5R1Q57qqzh7lggIP8KQmnmHRUm9Kgp
	PPBnC+kk4jIdL3qOtOhnEguMpRTZWafFodNy0habRv28=
X-Gm-Gg: AYBFou1wF4CYoi7aiJY+qclj8mj/tbcU+xUuAZSaZFVKPXmHwGrmmPqdq+H05SdWwxO
	Ba5qLT2f5lkEdSZ2LyCZgYDPMiDXYIOgIVkKg1zY144bOdzgyrQkXIS/ZFB7OkdU+E0GErXoCsQ
	GHGk5Z6JbOJnTujQVMSi8KQ9M0kAXDeXdc523ZF/JK8whgUkYkSDfzzxcsdZQzYu0SQskVjIcGZ
	RgA4F18Lxwc/1lsACI6ShcBGjZExnzqJU8dJ0eI+KRUAk3aNEd/NaogkLiVp2uQ30ZYEpE3RUHM
	Xl1AzxNdqSEmeEFdKksufROsxt/Fd7NsqSlWSYz2qmG4v/GEnZ4nNOB1H+Au9UY8ze5QdmIVmk4
	+niTEOd9Q7qqMbeJH8zyF9WCfxA4MYl23mxHYmcFcLZbQ
X-Received: by 2002:a05:690c:60c1:b0:892:63a4:15d0 with SMTP id
 00721157ae682-89445e46c1dmr2084807b3.18.1789588092839; Wed, 16 Sep 2026
 12:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
In-Reply-To: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
From: Chris Roy <iam@thechris.in>
Date: Thu, 17 Sep 2026 01:18:00 +0530
X-Gm-Features: AcwNN1VYczLI3qfzeZAdglwAACuJwuh2m1nqLPTRyKkEDS7QJFj91KjCu4jH1Mo
Message-ID: <CAE2Bdm1nss=2F4rAFo8_AjZJ6XwBiVnCmfvaZmjBd7=ZYvouKQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 01:10, syzbot
<syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    654ae5d73c05 Merge tag 'drm-fixes-2026-09-05' of https://g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11860cf9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
> dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.

I am investigating this report and working on reproducing the lockdep
cycle and identifying the root cause. I will follow up with findings
and a proposed fix shortly.

Regards,
- Chris

"But how could you live and have no story to tell?"
