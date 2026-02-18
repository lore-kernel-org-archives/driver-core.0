Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E2346A08
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771444741; cv=pass; b=M5Q29X95ww6wSOigigMqDBuEF1Icy3k9nndsLZMf4ASBq5OxjjyFsCfLvWfgZTKAIO90mCsEkolloj2gObsd0BXSMzNxIDeEj1Toj/ytA9S0uHjIipf7MIbUM3rI33jB7nVysALP/Kwxc8U+KKy/Dfpv3G2JLlZpSy5In1P7nOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771444741; c=relaxed/simple;
	bh=fAj9Q1ygswz4E6SrtEFpUTAbwt8zju3u9r/LEpTkE3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOWbW4tscqWgama/ha2lADHhd31/HH7Rg7POwpoZEGfWCITUhlb0dduCO4cNCyplD0UdgobJu3oHByVjLvE8rrHQq+Keg+XyO1TCaCFdd1WNYmaDDXUG0zC3O0RhWOQmgerj5GNKsOx+OPhSjfFGQVd3NPfNQQtlw9rEnbhxHyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQP8urBd; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQP8urBd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so15715e9.0
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 11:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771444739; cv=none;
        d=google.com; s=arc-20240605;
        b=cskEY6TjSpK/6ozbcj45wCN42xoo9kVF4amJr40vY1XX9nzbclUBuE5Nv3nhadbV3p
         ZFLwYmxPZdrROTqOKviKFc9rU0aKvS0BJ8mqnPvjA8Toj3tqOnOpHZwLEyLHsYpTR4Zx
         sgGY3E6ZWw72Fro5phTQUGR8HBHfr1z/nVbcS0shgxMiOLMWaPhcvjtPyjXPWF43JmkM
         RNiRNUvltGCWIPnuucTL2oIFsCRlk2DMV7s+HZNFXAx/yxHU1NO+IoPfpX3LFHnkp0S/
         XPzHtxivXAEDz2VIBUKlfjLRWIr401zJ+YMlzPweZZon0eo6w/mdr2Lq2ir7d0mN4u01
         Q0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        fh=IqjD8AvWdhK1SQ7ocx3GcUyBFPFU6deWmXEz5WkwiRM=;
        b=a4S6uYbTw+4XhQVeheHVWgpmjinnX+CnVxGvTOEuLl6luXLoxqI+TeQk3vV8QlqFQ8
         EYAOfrqlWujljVeht5s7ZhXPfslJ/4+/J7IIscTlTG0sU1+pdDkH5+lLiLcbqvvHASI6
         UtI8V6fcGktGAalo6AfM2mWMhkUxJCmdwc/R+MsIMjNGthL7L6kRXkuQ6KJFhRaWpHZx
         alwapPXo7Z76Ozcy+kPmvpaZa7zkV2Exc6wAunmew8VM87QgrkQrWDjA2jnGsfhX2V9B
         bqxBHbs618hvjHnaFK5cE7jyYqvJUvuxpvlnc6mz8HpD67+R5lazzDVdHj85+GSzcj6a
         OA2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771444739; x=1772049539; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        b=IQP8urBdFBPZFUjEwzzX11dwv0kzuR/i12KTzk+zm8GiW7QhwnTLUa0yLK4PQHdCq9
         FHEBHxw5uxhwGL9t94TVM8detNwNpNJLN/J1XR10GsGWUElk1GoeZZGoEiEhFrPin/BS
         6tvqvHw6Gx/STfIrA9hRrEEAmyHxEtFJjlu2EQYTF/xrZggKKyzsVqQ/MbNcTPhPhGv3
         br2/hco/2+j9QYd1Cw8nzoxeDeZ0u+vlyiCni9UcQKpO8AVTugk5N2dQwQ61iiPGinkw
         eXg5OYL7M7mJ8Wb4NViY0Q4ik/P1ssQOBU7FoZFDEBh1l2fXQP2eMFx258TwGc6QXSiv
         1x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444739; x=1772049539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        b=AInBXrUmIzg70Z7K32JEdJA6uA0hjGc6hjGHt1sJtuEYgz4k89BcANy5CalECfkxk4
         uLCTepM4aCdCpVFiPix5GXFFdNH+IOVhmg93ipTtqTUSYT6sHIZw6IAUMdN/18HK9obS
         6k6+VL8QPoqax9sE5nvC5nqZO/uA6eWCW+kXCnJfGQzoV97ySFmJt3rtzAz2vg8RVVVV
         WL3AQfCppvu69WwRAeTijYpyGi63DILo8p6UPhnkNw0GbhxIql5w20bPLt73QsKQJIQb
         3WkJGO8DU+HLpxKdYfIZeDO0qSbrIeRRkNxRbPLArHxoaJzOZ3tdFjJOPv8TScMAgWKn
         H4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+m5x5o+xXC76CTSiG1LvbZ6ELyQhlcKYB73Jp0cKY6ZUY2+WITGL/QzdTNsd7Ov2ANstk3Sj6Cs2c+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwApX5xlAEv3t9TR/XZ+mdQF7ibgEfhmBhCjl5TRr1/M+417Sox
	UQlYahWfrXiDe3nDp9uOVB5/ihxVfj4t2I6hoIeY16VL2P+SZ+A3WMHcwSjvgyiYueBotO98948
	5zgkNF2zXoQ14MYvZpJXY6uYyR1H20LA6/CfqN9IU
X-Gm-Gg: AZuq6aImoH6xngrHv7krNmz8y1oc1rowi63EPZKUrszPhSIaIPVUZP29QbSrqHTYfvX
	enLLcllv1xBsLH2yKhZE/lzva5xSE9da2xNb4uIymblc02bhKKCSdt4giJt+BcxIJkzNY8Zewkq
	G/TZmTLM4q44Xz7s28buX6yXSuQJ6Lso7gkPH773kREE5r5MJseWKfxZiz0hwJUZ4zd//VMeVdb
	38CMRACru3q4H6eUncJaxa3lws0DHiXdiDWPFrGIgz/nZrSNen46rnIKITn1oCvd3rpS7bgXxN5
	s2MTH/99ixtGoRddeNMvYAn4w89zQd5+8RF4xGApodzG50fD3Bj5t/lPVoIZWe6zRJVkZQ==
X-Received: by 2002:a05:600c:8b76:b0:475:da0c:38a8 with SMTP id
 5b1f17b1804b1-4839e5d9a1dmr138535e9.4.1771444738775; Wed, 18 Feb 2026
 11:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com>
 <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f> <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
In-Reply-To: <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 11:58:46 -0800
X-Gm-Features: AaiRm52n0lIK2grreFCNiF6qE3JVFwkwj9cGx62TA9xdekMRJsGok-FwMltR-JM
Message-ID: <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 11:15=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> >
> > On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wrot=
e:
> > > >
> > > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > > Currently some kernfs files (e.g. cgroup.events, memory.events) s=
upport
> > > > > inotify watches for IN_MODIFY, but unlike with regular filesystem=
s, they
> > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > > removed.
> > > >
> > > > Please see my email:
> > > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4zv=
xylx732voet@ol3kl4ackrpb
> > > >
> > > > I think this is actually a bug in kernfs...
> > > >
> > > >                                                                 Hon=
za
> > >
> > > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > > and shrink_dcache_parent is called, d_walk doesn't find any entries,
> > > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > > that is...
> >
> > Strange because when I was experimenting with this in my VM I have seen
> > __dentry_kill being called (if the dentries were created by someone loo=
king
> > up the names).
>
> Ahh yes, that's the difference. I was just doing mkdir
> /sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
> kernfs creates the dentries in kernfs_iop_lookup, so there were none
> when I did the rmdir because I didn't cause any lookups.
>
> If I actually have a program watching
> /sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
> calls, but despite the prior clear_nlink call i_nlink is 1 so
> fsnotify_inoderemove is skipped. Something must be incrementing it.

The issue was that kernfs_remove unlinks the kernfs nodes, but doesn't
clear_nlink when it does so. Adding that seems to work to generate
IN_DELETE_SELF and IN_IGNORED. I'll do some more testing and get a
patch ready.
