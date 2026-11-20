Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201074;
	b=QZAjLEZ7faN0VtRaccCgjkvzDk2NJVDvMvAh26HeIrVprmmnnGUJlq4OZgXoTV1bkx2U
	 co31ahHoCA53yrAyQP0OZPoG+NUbJmDscfZYNHQglRqKDptmjqvf2dQzZxC2IK8j5HncD
	 GEREjjWpcZAKpVbCjU5/1yua+rJzkM/VacwqO28Z0egLcAB7/7XvM0MmcU77lKy/tcCNN
	 E6UApO5cXh6YnlIgPL2gejc9vVYa9oRsN1wnExOABRbodpP+FJ0mv7LjJKkDY3dmfT183
	 45L94ffwk86MX2fQQR4muCrwz22IREpNfogUxZOXXbokwNJXOOesArEXWVtt0RtSNmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
	b=L1l+p9AL2NfzgmcIvdp/VUDbgbKKbExXDReCa6kPu8VNn6uhTne0ZSCFt9nd3N0m4Q6h
	 0bRUFbNkuiZ5845x0E9USat+dUyvWPUcemxMhUMZTcDMuG8axfzZP3nifrqaq6J+8W0uv
	 P5jQdqL5ifnj78fWu6ag6tmD0QdzbIVJq8JvNTy5TNdVGI8sd/vf9iOzKVAcLgXiQaMpo
	 IuyiBCkt0PsscxJWy/cjSwalVq5v99Utm9NKsHsiuYDU5gqL1LIDJf5WI0xCxIIN0pMqG
	 xNdEjJBZv4YGKC+yfX5/YA+AXk8qg75YOITV7k5JkEpqWj4+CmwKumIUpeJYhOn6xhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e57aCk1V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169A60A261A
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5169A60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e57aCk1V
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018493d57so4815e9.0
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 10:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201070; cv=none;
        d=google.com; s=arc-20260327;
        b=m5H468PmEn0gy562KDqR0XPWISzQFtCjbnA6C8bHop4yUQX6Synm/4ib8cvgibJK3z
         8qp7EOVquddprFmJQtk4LGl5avrJPRYteIRCeXGooysfPVTieKB3JMWFPlf+ShhZSP4J
         dlgm9TF5vCZvT6gIk//ylkHjs/STUHPJQ7JFl6aqQpaufVBl3JFX1QK8uP11jAAZAI3Z
         IiqSonKUEq+WgXXlEqcI8Qte4eZ9WBCLtOupGcJI7jZgwlIukBNY8r5H4W4yYlDfCowd
         wKvBi5ILkooxPKvRuUubPwVQMUUU78LUbGCGgnZA8jC7y/7K5hoh7mKjwFgsRJ35xkkm
         UImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        fh=q+AL1EmtTNEFyQxVLK35Qe4BzNlM28QWFRFoxjXGP1c=;
        b=PmeVGYJjYk8NF5Ut+tfSDG2nnTM3qe5X+GkKjBy8c3r+CPJfO70Wl/FG/GhUReGLx6
         g9xQV5GG5M1YaCmdEvbp/nm8Td9Ee6avnYsrRGaof1uTXyOlT02QWA/2cVpvfP2X/HH7
         oPWQTlINgVl1DjOoFFqgZLg8KrKBT2zxGr0csK53GZb3ShPmB94rIbH1qVCuGdBvmJIe
         hnfbVbDzM3kRIL71pAfMMfn0N+03f/tcRSIAdVr5KsCuUKTkZmNpgFqra0tCywuT8RTu
         aVpVJapYIiKNq5OGqjRcdSh4q60AIpHfVN/XNlBZn0dSA/D87mx8hu64hX8aG5kpAGTN
         xziw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201070; x=1795805870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        b=e57aCk1V39XybxQt9JDf1pHV0KtXFUdpeeGRdqu0KfRyjgjBBc4aSJbYjpg9oxP4WB
         ykk7nltdFb7E0RhBy89Beg+Kjqvp/v6sfG4Ij6Elg68TwLYNjvRnQRXIak/M7fhBoXf9
         z4mRosT4hFsoJOOnpdxB82Up27rRD7CrNl+zLu+zfghwEdh40RIrvmr71Fx+7+waCPK6
         XOUEiOUy6PqbXZmc9ZchuLAICaTCEiG0uggfjXpSRgQFrRxOHtcaHqNTDro58la/+zSk
         D1Ks5du5ti8GNK0o9f2Tto1JDYBM5Kl0vmsWJDx4agLt6V1l3BXWXvXnYEsC+fP2vBfh
         A5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201070; x=1795805870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        b=mDL1Es0fGCRo58+SVjEqwLf4X/bgGA4z+qvI7tlzq0pwoEmNjuVYuqKN2TgOj/ziYX
         Kl3+16r8uG4yfYp2JnjX2XDqBJl0cHvZfj5JFczQGUB1fd/bMf13ZSWUVCfuM85yd/c1
         rqdXezWFAr3oKXhRuFqUvg3+hN2qfkya+iUkMfNzMaho7SUq6NatS7j3wzJVwD8Zwydf
         XWzX+TltFVzo+i4ZXHOOBBBI8CbQh4qHxfqNKm7hhkaIFiDuNdxwkSsu4z9uixYJPLUw
         8we4UpJzLseZuYhOBqMwV/hpxa+fX0bkqOjZzJDJVsp5D6rNZCkGlfC/aXhmgEuI/m/k
         G6sA==
X-Forwarded-Encrypted: i=1; AL+hErHrFaQy4VP6i0L1v/B+gMTlgUo2Qujp1gdFNCw+nVZFU8P+sHGdwywbl4SpQt30BUbvQAZgV7C8LWOYAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9OZJKghHZ+XFSycUa+qFdlJxmpenFhsJ3qxV5DPOBGOt6ycwPf
	lFSUL/+pLIaUMgoLI12EhYu9QWkkNRd+npBavW6T61WxBqp6Q2m06RJvdvRcM/JFwtM7KGucmg7
	iXbB2TC91aCXt8rs8hfJLU71zMTdtm9stEXI9DPe2
X-Gm-Gg: AYBFou3ck112uaqzHnEuSKAweFMXismf0BWw1wHuj/2rej3Ll0L+qpiGwHGzbDdm+53
	LBMTqfquUnsoQntUEc+vAcCSwdloPYk1eENusuOIFuNMloh/HRiT8kuLaVpvnFgLy5ghnCKP98Z
	8lIzU7EFqVFICxHsGcnwBJhCVznXBO1kenwTubQyVc1RcuZP8vri7qZuYVSJPi3dBjoY1uITfbj
	acmRk9M30wDQzONZQTgqO3M1AnzBBGGoGf0czdPAZdDnNhEEFUOcD1qvKq/LWMkvRVF4roH9tca
	Y30pnVwbxHcuZkhr+7f6grfuo7yq3uWwcJEOifdu+bo0H2x38vV0J7DEsp/T1n/FQJfeyIO/qC7
	F/5sJbgVgDLotsjg0jxPxtd+yKTOWUNPp+q3xKYxCS7aNic7LT2IcmWwQdV883D9pnwQ=
X-Received: by 2002:a05:600c:10c5:b0:4bb:7ad8:9d1c with SMTP id
 5b1f17b1804b1-4bb90c5a063mr9505e9.6.1795201070230; Fri, 20 Nov 2026 10:57:50
 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118220154.2965621-1-shakeel.butt@linux.dev> <20261118220154.2965621-5-shakeel.butt@linux.dev>
In-Reply-To: <20261118220154.2965621-5-shakeel.butt@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Nov 2026 10:57:38 -0800
X-Gm-Features: Aa3M54qYEmkoCcL8K-eS_MrHU--U7Q8sr1Os1o1ROUSCVqxdCeBq63ucWRqqKwM
Message-ID: <CABdmKX3-2UeZpOV0hHX7qh4K5cMWba6E5JiURhJMyp87sY4RtQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] kernfs: don't take kernfs_iattr_rwsem to publish KERNFS_REMOVING
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Ian Kent <raven@themaw.net>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:02=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> __kernfs_remove() takes kernfs_iattr_rwsem for writing while it marks
> a subtree KERNFS_REMOVING, inside kernfs_rwsem.  Commit 507d8ce13f5b
> ("kernfs: Don't set_nlink for directories being removed") added it so
> that a refresh would not set the i_nlink of a directory whose removal
> has started.  The refresh no longer sets i_nlink, so the lock is not
> needed.
>
> The flag is only set here, under kernfs_rwsem.  Inode setup reads it
> under kernfs_rwsem.  getattr reads it without and reports the old link
> count or 0, either of which is right for a stat() racing the removal.
>
> Drop the lock, mark the store and the load, and read the flags once in
> kernfs_dir_nlink(), as the type bits share the word.
>
> kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:
>
>   5 dummy netdevs created and removed     1110 ->  740
>   100 cgroup mkdirs and 100 rmdirs        4500 -> 3000
>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  fs/kernfs/dir.c   | 10 ++++++----
>  fs/kernfs/inode.c |  7 +++++--
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index ef23eac684c6..890aca5d8d70 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -1604,15 +1604,17 @@ static void __kernfs_remove(struct kernfs_node *k=
n)
>
>         pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
>
> -       /* prevent new usage by marking all nodes removing and deactivati=
ng */
> -       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
> +       /*
> +        * Prevent new usage by marking all nodes removing and deactivati=
ng.
> +        * KERNFS_REMOVING is only set here, under kernfs_rwsem.
> +        * kernfs_dir_nlink() reads it without that lock.
> +        */
>         pos =3D NULL;
>         while ((pos =3D kernfs_next_descendant_post(pos, kn))) {
> -               pos->flags |=3D KERNFS_REMOVING;
> +               WRITE_ONCE(pos->flags, pos->flags | KERNFS_REMOVING);
>                 if (kernfs_active(pos))
>                         atomic_add(KN_DEACTIVATED_BIAS, &pos->active);
>         }
> -       up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
>
>         /* deactivate and unlink the subtree node-by-node */
>         do {
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 2f463c0354a5..ca234f69882b 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -165,9 +165,12 @@ static inline void set_inode_attr(struct inode *inod=
e,
>   */
>  static bool kernfs_dir_nlink(struct kernfs_node *kn, unsigned int *nlink=
)
>  {
> -       if (kernfs_type(kn) !=3D KERNFS_DIR)
> +       /* KERNFS_REMOVING can be set concurrently; read the flags once. =
*/
> +       unsigned short flags =3D READ_ONCE(kn->flags);

Hi Shakeel,

I'd like to ask for some code comments / documentation.

This lockless read relies on two rules for kn->flags... the type bits
and flags set before publication never change, and the other flags are
only changed with kernfs_rwsem held for write (except KERNFS_NS).

Parts of this are explained in a comment in kernfs_dop_revalidate()
but not on the field, and that comment doesn't cover KERNFS_HIDDEN or
KERNFS_SUICIDAL/SUICIDED.

Since this series adds a lockless reader that depends on these rules,
how about a comment on kernfs_node->flags like:

/*
 * Type bits, flags set before publication, and KERNFS_NS are stable;
the rest change under
 * kernfs_rwsem (write).  Lockless readers of changing flags must use
READ_ONCE(), taking
 * one snapshot if they also test stable bits.
 */


> +
> +       if ((flags & KERNFS_TYPE_MASK) !=3D KERNFS_DIR)
>                 return false;
> -       *nlink =3D (kn->flags & KERNFS_REMOVING) ? 0 :
> +       *nlink =3D (flags & KERNFS_REMOVING) ? 0 :
>                  READ_ONCE(kn->dir.subdirs) + 2;
>         return true;
>  }
> --
> 2.53.1-Meta
>
