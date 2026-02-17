Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427336C5AB
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356474; cv=pass; b=Pn7BWUBz+ddczpUK2l+7cnGiabgxj/u8+Y4IdovMB7bvvkBmZNDzsi7qfxmjBKI36b1bIkftFaXkiBrc6/XnbloBXjpKzEa/crM0pkpQ7aEyrMr7cl8ix3g7riDMDRyLtGSaP4oRZzdUldscmUZFvdmv1m2g6hrTNlQ8YpWPgrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356474; c=relaxed/simple;
	bh=2AkZD/xZt0VUvR9sJ0sGJHU4a65qrHn4YVu35A++2Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHWcpbKTIRwcp/UMQBBFIbpK5E+ffFwZzbBOAGvnv5+nXdPxl+LVS6vyyoyD8eOaKnoMiD2QvCe24LIoFI1Ima0eT+gqB93tQqcpdcJgCVY+mWj5e2AQYlVXXV9J+pioWzvJiJKsUu7dITTAq3v3nPeZrjk/tPSuonDwyuZMWjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNxgIrGk; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNxgIrGk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so10385e9.0
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 11:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356471; cv=none;
        d=google.com; s=arc-20240605;
        b=U74fCWJ/dvzl33ZXuwQrOwciIJpLi6EF9tbHzdQFTW/wD41CBSmVVYuV2YQoC4CKZ9
         gLGyttYRu6VkEyeS/VjvI/YFLqVwRddeaVYfIN2O2lEaMMeviHwlqBTPqyniPqExXHom
         e+YA7jWLB4Ur2WdOX8jHDN4au8g8BWuBYXhM3AKfXgyQJflOiM7QQ3NnnZZ10x0G7iAw
         7yB8g/t4NXWMwD6OXaprXGpyMFhUAxelC1vgBNU6LnXU7nGacLtX/2tgG4ve3EMrusEX
         xJNbohKW9rU84dlj/iY4UabVZ492M9hhcRiU6uCuHmwuL6Iexqj2uVHMVlEiU7EPA2UZ
         ngLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        fh=O6M4QvcbOMDMkorZ306+RRorKYOW0LAJz5TFyW7yLLM=;
        b=ki1rhkNrCpbNLydbksdv0427qVuciNZ1eSY+XRIHz8vW/mui5lBLcHpHTYsDp/uqC+
         2ooIH83S750GNGbUJBOTlSRV2uOIMnUmPmEh6MJ/450tC0/gPTfLyaFSqnFBrV/o2YUP
         ArVU+ZMoDq1y7asjo5vNBqD7DBvm3Yk2ywPmAyt7FVuM582CL0sFmbHXFRKcCL05lks9
         ccXwKqE1GmlhvWDSFaRZNYGPLud0B8aCqQaNxMDvWrQnt7aNqR4DtyCil7VycG2SLXVV
         Qlw886ue/iU1Q4wHrKeIc2VIWuLiNHyPrvbVifCS7giajH4s7DnmHJSXj3Jcb/1MbyLu
         9AKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356471; x=1771961271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        b=FNxgIrGkHTgJpWATNZiLvhsK9DZ/OSWnkfj8EpHfcBKEm8cEkqOfbP0/TOyYXP3DAp
         xhO3PX5pXV5cH/sxO/n1DBwNdS/IoRtCK5u2tcT9eU8KXeaC3o4w5VXV8v7yPCAGKzMy
         K38urpOjy2ftZ7QXt6SkiZBh6YaYSS3uYD5mollwtdEz3WoYuzJyg+LoRSliDU7+CDOU
         EPQ0bZVJWxn84pqzw3yw3TqXL1DfuvUpTx09MN341RiPHZ68qP1vQixnGbS5CNZEMs9s
         AWBES92rYGy0AcXDNgoMIwnAGyE8Z87JYYlUZwzepsEXoiSpVQ3JjZZbvmndH4aJdA83
         JnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356471; x=1771961271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbtQMFsGPA/6ldfqUOLBsftSiaWAN1XegIGnQQjLLP8=;
        b=oDE9kyxGER6qxmhw4KJ9gUn3zGl3KrUJDsaDzq/QMavKV1y75nW+496yVYkUE+Jghh
         v+vTonpB5pJoAdvhniG4ZdT1jebChRNP+odAfkurInrMNFCzzvQ5WrRPjV4czwHsb6rG
         BzWPKgQw38Ejlz9/wNMq0j68PqAZcd9F+OzwFQ7aWcKuSBjR04CahnEs2uq/ZXVR3rvA
         H3esoQBWojrb04PpxUQO9Z3EaPcY+lrGlfD4Fq87OMaf97iAZoXMhf3QdSXGJo3OB2Ho
         sdzimfJHbQo4nc82LdSw1kLAHysbnq2aScbQ2/ZvlL1/8OEyFbsBW/swRlqbXwji9PyK
         yxVw==
X-Forwarded-Encrypted: i=1; AJvYcCVharo91jdocVdODm4DoSCPYMokhGTRFvCrl89mtRRELPscDP3fGX1VKV4aGWQ1j1aTZ6lurt8aBl9pOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZNWd9Url4Mph9Q2vabCTWY9k0Dr8CWSrakOwF0FM615hbem/j
	TMWgHs8pLQQxbuw3G8l5KCrzAxGqlPw4kDgmYygCXdxj0YL0MRZDedtVfyoQKgKQpqK7KMBJPV7
	dk6ElQ15VVp9YhQjkjVvnuzZqOQcaER7oVVCF/4ne
X-Gm-Gg: AZuq6aK3kTk+PzRnItVbZpPRwr0G2JeL5qmQmMKPlI/LD2+CKNOVKOf1bSsnEZiZPsf
	OwIE4fjxeBWeKeeLN76STvzgchKhT+BGfRB2SpHjbkuWFebyaoYugtdMiAjAoioYmYuMfWZ0jg9
	OhGMGpXjYrr/rbDsohC2ZiBKeVgSSd6b8awQOhO/MS0ah5MmNJbJHZ78vjqN/Uh7hoknWB7CnAx
	jiFaXAwSMjD4NuXIM+aZq6K8wdO3Dgo3c3Zq1PfZEhBv7M9HHBR67Vs11ZZTfkgSs46TuF+lbz6
	vA+YXUfrb5IfuS9R+uSvpxbiJEVtj+ZqKuZAiXOLK6foplAtJVC9OB3Qb/Pifh8pBJaQZg==
X-Received: by 2002:a05:600c:6a0f:b0:477:86fd:fb49 with SMTP id
 5b1f17b1804b1-48388809dd1mr1315515e9.10.1771356470995; Tue, 17 Feb 2026
 11:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-2-tjmercier@google.com>
 <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
In-Reply-To: <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:27:38 -0800
X-Gm-Features: AaiRm50lkIkI0vTw0pKWrhRFJ18Z83k0MjgydYcYSeBtbsOtDjpOH99UjI76ZFk
Message-ID: <CABdmKX2DD4iapAGtdjJyb7CAHiS9RaD3pbuAnd=1tvudxfJkKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 8:27=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Feb 12, 2026 at 01:58:12PM -0800, T.J. Mercier wrote:
> > The kernfs_notify function is hardcoded to only issue FS_MODIFY events
> > since that is the only current use case. Allow for supporting other
> > events by adding a notify_event field to kernfs_elem_attr. The
> > limitation of only one queued event per kernfs_node continues to exist
> > as a consequence of the design of the kernfs_notify_list. The new
> > notify_event field is protected by the same kernfs_notify_lock as the
> > existing notify_next field.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Looks fine
> Feel free to add
> Acked-by: Amir Goldstein <amir73il@gmail.com>

Thanks Amir.

>
> > ---
> >  fs/kernfs/file.c       | 8 ++++++--
> >  include/linux/kernfs.h | 1 +
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> > index 9adf36e6364b..e978284ff983 100644
> > --- a/fs/kernfs/file.c
> > +++ b/fs/kernfs/file.c
> > @@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       struct kernfs_node *kn;
> >       struct kernfs_super_info *info;
> >       struct kernfs_root *root;
> > +     u32 notify_event;
> >  repeat:
> >       /* pop one off the notify_list */
> >       spin_lock_irq(&kernfs_notify_lock);
> > @@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       }
> >       kernfs_notify_list =3D kn->attr.notify_next;
> >       kn->attr.notify_next =3D NULL;
> > +     notify_event =3D kn->attr.notify_event;
> > +     kn->attr.notify_event =3D 0;
> >       spin_unlock_irq(&kernfs_notify_lock);
> >
> >       root =3D kernfs_root(kn);
> > @@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >               if (parent) {
> >                       p_inode =3D ilookup(info->sb, kernfs_ino(parent))=
;
> >                       if (p_inode) {
> > -                             fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
> > +                             fsnotify(notify_event | FS_EVENT_ON_CHILD=
,
> >                                        inode, FSNOTIFY_EVENT_INODE,
> >                                        p_inode, &name, inode, 0);
> >                               iput(p_inode);
> > @@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >               }
> >
> >               if (!p_inode)
> > -                     fsnotify_inode(inode, FS_MODIFY);
> > +                     fsnotify_inode(inode, notify_event);
> >
> >               iput(inode);
> >       }
> > @@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
> >       if (!kn->attr.notify_next) {
> >               kernfs_get(kn);
> >               kn->attr.notify_next =3D kernfs_notify_list;
> > +             kn->attr.notify_event =3D FS_MODIFY;
> >               kernfs_notify_list =3D kn;
> >               schedule_work(&kernfs_notify_work);
> >       }
> > diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> > index b5a5f32fdfd1..1762b32c1a8e 100644
> > --- a/include/linux/kernfs.h
> > +++ b/include/linux/kernfs.h
> > @@ -181,6 +181,7 @@ struct kernfs_elem_attr {
> >       struct kernfs_open_node __rcu   *open;
> >       loff_t                  size;
> >       struct kernfs_node      *notify_next;   /* for kernfs_notify() */
> > +     u32                     notify_event;   /* for kernfs_notify() */
> >  };
> >
> >  /*
> > --
> > 2.53.0.273.g2a3d683680-goog
> >
