Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D53D669C
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772548088; cv=pass; b=YoJlzUiPhwMO9O6KoS5jNwITZrJvzy0jvn845ob7fVTy0S8wSvwEmL4PrsshZAslZ35ZC1nczQxhaA9WHHXFhvaFXeKOggBBdirHHOHGkjrct9gDnHm0bK1FW0v9A1HrcQAN5HkQTrsPyLsEvfBV3I4eeqg0DrvlsoGhRElH+So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772548088; c=relaxed/simple;
	bh=qOdUJuVi1m7ZhJj3GOzZ12rW1y19M/G1m+dBYN2uy5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ0hy33x9KIMCgHOuCJJV0i5mvgnSyEuR621ljcY1r71xtZQFYOv3UCCiIQ7WbejKR9Cq2WPIOs7FSucqGodi9btQoHWmjv18fdeppUXn97yhWR1UnY+HrDzNUt+45ab3F0141YZs6zkfzGc7+Wt8xdC1QCuYsO/KGkZrw7qqOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yxcm1arz; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yxcm1arz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so855698066b.1
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 06:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772548085; cv=none;
        d=google.com; s=arc-20240605;
        b=a44L8bBYGNA/qX2hRt5bBKjOlLR0rAG9W0xy1X52DNYYs9KJPFOHTJhV9JmlvltLN+
         mQKVjRlIUU+BBGaFcTOERHkU3IWgtO6nnAvhB7UH1XNdspxh4rLPkiO+DjEjbfWti5b1
         rCswyTNSUeyCQR97VQQDA1fFJ8T3f7FWbRtSpr2x1ILriNpvaUR66aO19eiQXfaf55en
         +rdA+YgDn+nErU9lzjfMeJ+npqoAV0LiGWm7qGj0fGBveIDf7Zb5gt9aZjOn+1F8yZMa
         EtCy/KzfyY5GkZyaAtKtmFbu2F+HyGFOt8H+rVBRkswDVPJpku28mYNbQFk7V+X899tJ
         2eOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=esp1UcxTOWDHIY9Li2rUvASCUzf5NNQ0S/tQeT7QTjY=;
        fh=Vxc9HbBfYr5TuZvWs6xMyh7ODgA0eSpMGCa2vJy3Ots=;
        b=O0pYj/8AOfMxk303tyUcsR+MSc1ks24501qCzPZVr2qxIoOrZIUUvx7BZ785iloJwA
         TCVXyE+AmqHBQKQ+AQDdKs2bZ/RQ1KGV8UXf4qdWzQukGy20Cxm/7txplpdoUnI7DWZW
         1QDB6KG1C1Io4wATrwbga14TYs25VJtkGwxSld5Nm39hoUJDUr1T+cwqSR623LD/PU+b
         2Jp19QssdSbo3fqdFC5j0vJrDEcWPsp1KYOdx5IL/JNDY45gTo6YAOdKJen7NLkXzTIx
         /9clPIfMcQNbzbysq74MgLkDCXyG7BuLZsDYDPRNPv30R/DJZ6Mt+IrTENvtndwKp7bl
         piuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772548085; x=1773152885; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esp1UcxTOWDHIY9Li2rUvASCUzf5NNQ0S/tQeT7QTjY=;
        b=Yxcm1arzK5esqQo25UWkiEFve5xSrux9zWoL+Xe++jBGmrFTUo7Md1nlAQ6lfk2pLt
         J2Hu4iU5f8CUN/BPpag2NPmF4w1aHk7vu/D+9X6ayeUv7xuuHwbj5xBkE1Bxsh80RIvx
         zEaYaznA2LWcT9GtyLCOypiWBOOSM8zNLIwKN75Ze0ljdJLvvqm3TtAWULti+wtZZI6n
         IdtNz3OlcbtqMwgxNzEp/JQ93o25J81NXvGotjRIYDjnUTchnjG52SO5Mill44STpYis
         h6p8Qa/FlJn+oJW/MQtDkD923ByLt2bIqHMj807fl2laXQNVnnu8oyRiqaqLFp55a85j
         C8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772548085; x=1773152885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esp1UcxTOWDHIY9Li2rUvASCUzf5NNQ0S/tQeT7QTjY=;
        b=iuPJMzN3lDXTyrEjNXFCPeRNVfh0LbSxfbL30Vst87ecJfXRIjgvhtSTFJ8W8Gpg4G
         sqvLhPVIiT733aYEAmmDQkmPcz/BMnXZ/XWNfYalLepw+fyj7O/v84iTu+6KqpmSvVvS
         1J0s8ToR2kjGps4XD478mXS0CT0tqV0ZwPs0yUCV4+SThX5/MLSO2iGOqo4lIEza8iCi
         lB2G85Xp/vxsKcg98OWcfOW2ldm1feiv6ueswav+ZZVBIqJR7LMzU017Ks09wzf9JhDy
         2BpVG/9wXIR208s28BLR2awXjhyYTRUrKvxG9XTFRJYVKwUApX9RIV4FWB5qBIXsba4X
         fAEg==
X-Forwarded-Encrypted: i=1; AJvYcCURjYqQ0RQ3j+KGbj4W0pfAlxX1LB9agXLXB6FG0Cqsal4lU7JRkLoIRmr/VSiS0IvgoPMbcbfyfX1R+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YywNPN+FhXWeOWc4iLUehmrtyI0iD+I0eGsxDzZmzXpw/xA5qKw
	7vOVgsHC2ZboNV6hhre9aQyZeEjEL++fLZMNY9MI3CNl2V+GHrWYLoBfZyYsaGSVRtnrjcHTnLi
	AUGdlBXSx54AXfWF8jl8CJwjC/rEIS8s=
X-Gm-Gg: ATEYQzwL/Byr0aBwzf8i7FFnIZWRRPab/DaTl5Z9w8Dwun/J5zVsdzgcTREv6sDfO/Q
	ZZIyEBPFHuObKvVfmQxEacWoKhc+HmajZMtErLveWlpTYOt4yQpWx9h27Rnq0rX6RueRt6Ym2Bw
	MnNuKGZfZv2wcYR0RbGaAHdEd4YBEOMnnpo9MDpXqhmx4gcLvRTlnP/VjFbkTN5ysSZuHCScnVQ
	aLwbxzY6O1+W4Zg5m8X48IUKhyDZgxNPN9VATkRLtoDYmiyGRTTGu2s+pzjlCME0KuVk79047pY
	ipT62o3PwlYSMT+p1EgQIc+ZsibYfeiXO5eGUuxOqV857ITif2Ky
X-Received: by 2002:a17:906:5957:b0:b8e:92e:d316 with SMTP id
 a640c23a62f3a-b93765684e6mr694232166b.56.1772548084865; Tue, 03 Mar 2026
 06:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org> <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
 <aZi6_K-pSRwAe7F5@slm.duckdns.org> <CAOQ4uxjZZSRBwZ2ZL31juAUu0-sAUnPrJWvQuJ2NDaWZMeq0Fg@mail.gmail.com>
 <aZju-GFHf8Eez-07@slm.duckdns.org> <CAOQ4uxgzuxaLt2xs5a5snu9CBA_4esQ_+t0Wb6CX4M5OqM5AOA@mail.gmail.com>
 <aZx_8_rJNPF2EYgn@slm.duckdns.org> <20260224-hetzen-zeitnah-a3e1e08367cc@brauner>
In-Reply-To: <20260224-hetzen-zeitnah-a3e1e08367cc@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Mar 2026 15:27:52 +0100
X-Gm-Features: AaiRm52i2NAug7aj4ITPTwYuE6XkZvKlA8xrZKtvkZavq_ZPH4PZm8-pNbBhwCc
Message-ID: <CAOQ4uxhSL3ZRzNjM6AM_poxeTsYgWb5_f3tO6_4ketg8sFSOBw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Christian Brauner <brauner@kernel.org>, jack@suse.cz, Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f255a4064c1f8291"

--000000000000f255a4064c1f8291
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:03=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> On Mon, Feb 23, 2026 at 06:27:31AM -1000, Tejun Heo wrote:
> > (cc'ing Christian Brauner)
> >
> > On Sat, Feb 21, 2026 at 06:11:28PM +0200, Amir Goldstein wrote:
> > > On Sat, Feb 21, 2026 at 12:32=E2=80=AFAM Tejun Heo <tj@kernel.org> wr=
ote:
> > > >
> > > > Hello, Amir.
> > > >
> > > > On Fri, Feb 20, 2026 at 10:11:15PM +0200, Amir Goldstein wrote:
> > > > > > Yeah, that can be useful. For cgroupfs, there would probably ne=
ed to be a
> > > > > > way to scope it so that it can be used on delegation boundaries=
 too (which
> > > > > > we can require to coincide with cgroup NS boundaries).
> > > > >
> > > > > I have no idea what the above means.
> > > > > I could ask Gemini or you and I prefer the latter ;)
> > > >
> > > > Ah, you chose wrong. :)
> > > >
> > > > > What are delegation boundaries and NFS boundaries in this context=
?
> > > >
> > > > cgroup delegation is giving control of a subtree to someone else:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git/tree/=
Documentation/admin-guide/cgroup-v2.rst#n537
> > > >
> > > > There's an old way of doing it by changing perms on some files and =
new way
> > > > using cgroup namespace.
> > > >
> > > > > > Would it be possible to make FAN_MNT_ATTACH work for that?
> > > > >
> > > > > FAN_MNT_ATTACH is an event generated on a mntns object.
> > > > > If "cgroup NS boundaries" is referring to a mntns object and if
> > > > > this object is available in the context of cgroup create/destroy
> > > > > then it should be possible.
> > > >
> > > > Great, yes, cgroup namespace way should work then.
> > > >
> > > > > But FAN_MNT_ATTACH reports a mountid. Is there a mountid
> > > > > to report on cgroup create? Probably not?
> > > >
> > > > Sorry, I thought that was per-mount recursive file event monitoring=
.
> > > > FAN_MARK_MOUNT looks like the right thing if we want to allow monit=
oring
> > > > cgroup creations / destructions in a subtree without recursively wa=
tching
> > > > each cgroup.
> > >
> > > The problem sounds very similar to subtree monitoring for mkdir/rmdir=
 on
> > > a filesystem, which is a problem that we have not yet solved.
> > >
> > > The problem with FAN_MARK_MOUNT is that it does not support the
> > > events CREATE/DELETE, because those events are currently
> >
> > Ah, bummer.
> >
> > > monitored in context where the mount is not available and anyway
> > > what users want to get notified on a deleted file/dir in a subtree
> > > regardless of the mount through which the create/delete was done.
> > >
> > > Since commit 58f5fbeb367ff ("fanotify: support watching filesystems
> > > and mounts inside userns") and fnaotify groups can be associated
> > > with a userns.
> > >
> > > I was thinking that we can have a model where events are delivered
> > > to a listener based on whether or not the uid/gid of the object are
> > > mappable to the userns of the group.
> >
> > Given how different NSes can be used independently of each other, it'd
> > probably be cleaner if it doesn't have to depend on another NS.
> >
> > > In a filesystem, this criteria cannot guarantee the subtree isolation=
.
> > > I imagine that for delegated cgroups this criteria could match what
> > > you need, but I am basing this on pure speculation.
> >
> > There's a lot of flexibility in the mechanism, so it's difficult to tel=
l.
> > e.g. There's nothing preventing somebody from creating two separate sub=
trees
> > delegated to the same user.
>
> Delegation is based on inode ownership I'm not sure how well this will
> fit into the fanotify model. Maybe the group logic for userns that
> fanotify added works. I'm not super sure.
>
> > Christian was mentioning allowing separate super for different cgroup m=
ounts
> > in another thread. cc'ing him for context.
>
> If cgroupfs changes to tmpfs semantics where each mount gives you a new
> superblock then it's possible to give each container its own superblock.
> That in turn would make it possible to place fanotify watches on the
> superblock itself. I think you'd roughly need something like the
> following permission model:
>

It's hard for me to estimate the effort of changing to multi sb model,
but judging by the length of the email I trimmed below, it does not
sound trivial...

How do you guys feel about something like this patch which associates
an owner userns to every cgroup?

I have this POC branch from a long time ago [1] to filter all events
on sb by in_userns() criteria.  The semantics for real filesystems
were a bit difficult, but perhaps this model can work well for these
pseudo singleton fs.

I am trying to work on a model that could be useful for both cgroupfs
and nsfs:

If user is capable in userns, user will be able to set an sb
watch for all events (say DELETE_SELF) on the sb, for objects
whose owner_userns is in_userns() of the fanotify listener.

This will enable watching for torn down cgroups and namepsaces
which are visible to said user via delegated cgroups mount
or via listns().

I would like to allow calling fsnotify_obj_remove() hook with
encoded object fid (e.g. nsfs_file_handle) instead of the vfs inode,
so that cgroupfs/nsfs could report dying objects without needing
to associate a vfs inode with them.

WDYT? Is this an interesting direction to persure?

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/CAOQ4uxgt1Cx5jx3L6iaDvbzCWPv=3Dfc=
MgLaa9ODkiu9h718MkwQ@mail.gmail.com/

--000000000000f255a4064c1f8291
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cgroup-track-owner_userns-per-cgroup.patch"
Content-Disposition: attachment; 
	filename="0001-cgroup-track-owner_userns-per-cgroup.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mmao8jni0>
X-Attachment-Id: f_mmao8jni0

RnJvbSA0YjNhNTZiOGNhNTQ4MzU0MjE0MzI5NzI5OTk3YTc4YzcyYTAxNmQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDMgTWFyIDIwMjYgMTQ6MDQ6MjIgKzAxMDAKU3ViamVjdDogW1BBVENIXSBjZ3Jv
dXA6IHRyYWNrIG93bmVyX3VzZXJucyBwZXIgY2dyb3VwCgpBZGQgb3duZXJfdXNlcm5zIGZpZWxk
IHRvIHN0cnVjdCBjZ3JvdXAgdG8gcmVjb3JkIHdoaWNoIHVzZXIgbmFtZXNwYWNlCm93bnMgYSBn
aXZlbiBjZ3JvdXAuCgpGb3IgaGllcmFyY2h5IHJvb3RzLCB0aGUgb3duZXIgaXMgYWx3YXlzIGlu
aXRfdXNlcl9ucy4KRm9yIGNncm91cHMgY3JlYXRlZCB2aWEgbWtkaXIgKGNncm91cF9jcmVhdGUo
KSksIHBvc3NpYmx5IGluc2lkZSBhCmRlbGVnYXRlZCBjZ3JvdXAgbmFtZXNwYWNlLCB0aGUgb3du
ZXIgaXMgdGhlIHVzZXIgbmFtZXNwYWNlIG9mIHRoZQpjcmVhdGluZyB0YXNrJ3MgY2dyb3VwIG5h
bWVzcGFjZS4KClRoaXMgZmllbGQgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIGRlbGl2ZXJpbmcgdXNl
cm5zLXNjb3BlZCBmc25vdGlmeQpldmVudHMgKGUuZy4gRkFOX0RFTEVURV9TRUxGIHZpYSBGQU5f
RklMRVNZU1RFTV9NQVJLKSB3aGVuIGEgY2dyb3VwIGlzCmRlc3Ryb3llZCwgYWxsb3dpbmcgYSBz
dWZmaWNpZW50bHkgcHJpdmlsZWdlZCBhZG1pbiBpbnNpZGUgYSBkZWxlZ2F0ZWQKY2dyb3VwIG5h
bWVzcGFjZSB0byB3YXRjaCBmb3IgY2dyb3VwIHRlYXJkb3duIHdpdGhvdXQgcmVxdWlyaW5nIGFj
Y2Vzcwp0byB0aGUgZnVsbCBzeXN0ZW0gdmlldy4KClNpZ25lZC1vZmYtYnk6IEFtaXIgR29sZHN0
ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9jZ3JvdXAtZGVmcy5o
IHwgOCArKysrKysrKwoga2VybmVsL2Nncm91cC9jZ3JvdXAuYyAgICAgIHwgNiArKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvY2dyb3VwLWRlZnMuaCBiL2luY2x1ZGUvbGludXgvY2dyb3VwLWRlZnMuaAppbmRleCBiYjky
ZjVjMTY5Y2EyLi40ZWUzNDQ3OTJhMWQ1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Nncm91
cC1kZWZzLmgKKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXAtZGVmcy5oCkBAIC0zMyw2ICszMyw3
IEBAIHN0cnVjdCBrZXJuZnNfb3BzOwogc3RydWN0IGtlcm5mc19vcGVuX2ZpbGU7CiBzdHJ1Y3Qg
c2VxX2ZpbGU7CiBzdHJ1Y3QgcG9sbF90YWJsZV9zdHJ1Y3Q7CitzdHJ1Y3QgdXNlcl9uYW1lc3Bh
Y2U7CiAKICNkZWZpbmUgTUFYX0NHUk9VUF9UWVBFX05BTUVMRU4gMzIKICNkZWZpbmUgTUFYX0NH
Uk9VUF9ST09UX05BTUVMRU4gNjQKQEAgLTU1MSw2ICs1NTIsMTMgQEAgc3RydWN0IGNncm91cCB7
CiAKIAlzdHJ1Y3QgY2dyb3VwX3Jvb3QgKnJvb3Q7CiAKKwkvKgorCSAqIFRoZSB1c2VyIG5hbWVz
cGFjZSB0aGF0IG93bnMgdGhpcyBjZ3JvdXA6IHRoZSBjcmVhdGluZyB0YXNrJ3MKKwkgKiBjZ3Jv
dXBfbnMtPnVzZXJfbnMgZm9yIGNoaWxkIGNncm91cHMsIG9yIGluaXRfdXNlcl9ucyBmb3IKKwkg
KiBoaWVyYXJjaHkgcm9vdHMuICBEZXRlcm1pbmVzIHRoZSBzY29wZSBvZiBmaWxlc3lzdGVtIHdh
dGNoZXMuCisJICovCisJc3RydWN0IHVzZXJfbmFtZXNwYWNlICpvd25lcl91c2VybnM7CisKIAkv
KgogCSAqIExpc3Qgb2YgY2dycF9jc2V0X2xpbmtzIHBvaW50aW5nIGF0IGNzc19zZXRzIHdpdGgg
dGFza3MgaW4gdGhpcwogCSAqIGNncm91cC4gIFByb3RlY3RlZCBieSBjc3Nfc2V0X2xvY2suCmRp
ZmYgLS1naXQgYS9rZXJuZWwvY2dyb3VwL2Nncm91cC5jIGIva2VybmVsL2Nncm91cC9jZ3JvdXAu
YwppbmRleCBjMjJjZGE3NzY2ZDg0Li5lMGJlYWY1Y2M4YzQ5IDEwMDY0NAotLS0gYS9rZXJuZWwv
Y2dyb3VwL2Nncm91cC5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvY2dyb3VwLmMKQEAgLTEzODEsNiAr
MTM4MSw3IEBAIHN0YXRpYyB2b2lkIGNncm91cF9leGl0X3Jvb3RfaWQoc3RydWN0IGNncm91cF9y
b290ICpyb290KQogCiB2b2lkIGNncm91cF9mcmVlX3Jvb3Qoc3RydWN0IGNncm91cF9yb290ICpy
b290KQogeworCXB1dF91c2VyX25zKHJvb3QtPmNncnAub3duZXJfdXNlcm5zKTsKIAlrZnJlZV9y
Y3Uocm9vdCwgcmN1KTsKIH0KIApAQCAtMjE5NSw2ICsyMTk2LDcgQEAgaW50IGNncm91cF9zZXR1
cF9yb290KHN0cnVjdCBjZ3JvdXBfcm9vdCAqcm9vdCwgdTMyIHNzX21hc2spCiAJcm9vdF9jZ3Jw
LT5rbiA9IGtlcm5mc19yb290X3RvX25vZGUocm9vdC0+a2Zfcm9vdCk7CiAJV0FSTl9PTl9PTkNF
KGNncm91cF9pbm8ocm9vdF9jZ3JwKSAhPSAxKTsKIAlyb290X2NncnAtPmFuY2VzdG9yc1swXSA9
IHJvb3RfY2dycDsKKwlyb290X2NncnAtPm93bmVyX3VzZXJucyA9IGdldF91c2VyX25zKCZpbml0
X3VzZXJfbnMpOwogCiAJcmV0ID0gY3NzX3BvcHVsYXRlX2Rpcigmcm9vdF9jZ3JwLT5zZWxmKTsK
IAlpZiAocmV0KQpAQCAtNTYwNyw2ICs1NjA5LDcgQEAgc3RhdGljIHZvaWQgY3NzX2ZyZWVfcndv
cmtfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQkJY2dyb3VwX3B1dChjZ3JvdXBfcGFy
ZW50KGNncnApKTsKIAkJCWtlcm5mc19wdXQoY2dycC0+a24pOwogCQkJcHNpX2Nncm91cF9mcmVl
KGNncnApOworCQkJcHV0X3VzZXJfbnMoY2dycC0+b3duZXJfdXNlcm5zKTsKIAkJCWtmcmVlKGNn
cnApOwogCQl9IGVsc2UgewogCQkJLyoKQEAgLTU4NDgsNiArNTg1MSw4IEBAIHN0YXRpYyBzdHJ1
Y3QgY2dyb3VwICpjZ3JvdXBfY3JlYXRlKHN0cnVjdCBjZ3JvdXAgKnBhcmVudCwgY29uc3QgY2hh
ciAqbmFtZSwKIAlpZiAoIWNncnApCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCisJY2dy
cC0+b3duZXJfdXNlcm5zID0gZ2V0X3VzZXJfbnMoY3VycmVudC0+bnNwcm94eS0+Y2dyb3VwX25z
LT51c2VyX25zKTsKKwogCXJldCA9IHBlcmNwdV9yZWZfaW5pdCgmY2dycC0+c2VsZi5yZWZjbnQs
IGNzc19yZWxlYXNlLCAwLCBHRlBfS0VSTkVMKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF9mcmVl
X2NncnA7CkBAIC01OTU2LDYgKzU5NjEsNyBAQCBzdGF0aWMgc3RydWN0IGNncm91cCAqY2dyb3Vw
X2NyZWF0ZShzdHJ1Y3QgY2dyb3VwICpwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsCiBvdXRfY2Fu
Y2VsX3JlZjoKIAlwZXJjcHVfcmVmX2V4aXQoJmNncnAtPnNlbGYucmVmY250KTsKIG91dF9mcmVl
X2NncnA6CisJcHV0X3VzZXJfbnMoY2dycC0+b3duZXJfdXNlcm5zKTsKIAlrZnJlZShjZ3JwKTsK
IAlyZXR1cm4gRVJSX1BUUihyZXQpOwogfQotLSAKMi41My4wCgo=
--000000000000f255a4064c1f8291--
