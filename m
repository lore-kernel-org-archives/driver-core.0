Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57F03793CA
	for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789316279; cv=pass; b=UYzaw5lOtykDXlQGpw686z5lUKovsnV0HJu/S/5Xi/m9sFpNlxFsnMDBeeXRzELlvV3HOSErlkYhf/4WBwHi62KvRViZtNhJfj8aEafoz66DnuOPpP1D9qHrZkKzV6ieIHV+s35JcIOHMhKAsykVeNLAbcIsX/dkE013pP6cFn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789316279; c=relaxed/simple;
	bh=qrjaa3A/zSN3z/kTwF5pNuuhb8WEmUsn7IuE9lN2/WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnK2rV6vZxvis5jsjb2oJCh0kVs4fwmc/M3Wwk/0//xmUr5m/+hJu0uILZjmVEQeo4DXuCIDbBBXiQ6DHYkQfhqUvi+CnnGT2yvYFFmCq4/dUuqjhF2ZUOUIOPvooT5o5CKLMokjB4pUbauSLlddH8Fdp2q4CW7WHMzGRtF6lEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biKHytqZ; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biKHytqZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so26635e9.1
        for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 09:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789316273; cv=none;
        d=google.com; s=arc-20260327;
        b=lHzweVvse3g+U+plU93HC6Q+FpM2IEAmNGbVEdOQUU6WYPJNfWEkUVuD4885QCcfvN
         lkI/G80jOl2Df1zUozviLx13+rAu0siy0h8F6u4b/NF3nhm/7GMxP7GHHLtzt0myj0Rw
         LL1udEPYuxkZ4V3fdy/J25OjiHWnnU/SiSMKAp5yX6rQqYjT3o4CETaIpMq9mqzMaf0g
         ExyV5bbOBdpQf++8918zY+4jx9+BkAbYZQQeGUakPJ3VnzYNN7DuaEIf/NGMbSR5AGu6
         CvlwlqftFRqBYI2w+iA81qUywMAfyp15ew7dviTA05R91HQWiOhTsFXWY53tgfS+oJu3
         lyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        fh=+XP0BEfA2raE0spXQEglmUVuSURwMKv86NlIabyICCQ=;
        b=n5JOA6KMzHHI701+wz7WMWoT9jqkTESBCYABU/S8EoCixBeQtk86/yRxRjRyei0Fsh
         i/jKBTfs81pIaGNpxFwgCD2Ov4QQdVLR7H6NDDbnoIez2j3gbo80uf9qwzwGh8qg4D7y
         SPOijVXLzXXDAT5WwQyES6eu9vVoLnKGfrW9CY2X6wDpT4kxR0A1a/ixfuFqHyvQX8yS
         0pQCNd9Bt7psjjve4zlIfrJpxBpe06uPox2yk86x8Wqq7OAQJLKhIFJdYzyZbfH5NqRL
         IMWQ4sNg1mG8++DExnNVjUMiGdbmhaFpIY3ohDrrDjydx9emJSCh93VOVdYM80UKs1d5
         lrgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789316273; x=1789921073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        b=biKHytqZjB+esaY1+mT9jeC63olO28Z/cOzdhc/4rAkrXqMnhryRPlPYqiWRQNMBjQ
         MynGTP+pcY0r/CqJ+Gt4sxhfp/4unG9vF4bwYjwDzzLvshttcAT7NmQMaFA3Jq92YIr2
         Gg7wOD8hh1t0E6WRBWnRCYh8FS0WcQqy2an0rbYRjh+Dx/VRJZ/oLsy40FGul9ACUBq6
         +3DQX/E4kSXlbIdN+zibDUpVfxsCbfj8KVnmQPC566bWDvw9xkQQ5kHl+GpioFe2Bwqn
         XasR/dcmB71rvUo+kC8dHupavmJlhKWG/xJx4VPnVZDN160PcyDHSpyDPc9juanVqJbO
         4pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789316273; x=1789921073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        b=TV2TzQf3xj04Mr/tDuqcKYmZzesiikEvfQpEC9Bz/w7q+Hw1zx5WuRds5ECqh/6xsD
         2x/M6628nVTGRkEOHrpC36sqRvZeNV0mfTglFOv/JRPbkwHqGQGT6LzqbokVXoTy/Hr8
         hWbIbluQWYN/nJzmkDZ8Ln2f5L1VTZ9gYeKZCPNip36iTDtB2p8BSLlwN8l/Q+GWb4CW
         KHOMzXVmqQ6vG7CoCgoQoR3I7+fmvcdtKfEjnFOcUVHi9MgY0R2n5W7ynZFXtOQwZl1h
         wgvj3QeczRZrF3jepLd9Rn58VfEmKa2bewY0BpsQgmxflEUgLGIGfxxKtb9GOXRQlIRY
         fY1g==
X-Forwarded-Encrypted: i=1; AKwUvBylXQ3Nq6a1KWfuHDhVApSBYuvRf9BYe+zL1z/8BGujhdch0RyTlFe5il4+CMacBAtwXuTC6Jw3yq4Qyg==@lists.linux.dev
X-Gm-Message-State: AFuF++k3m6f+/zaqOwhx0ole2M8Dd9f46XkwVq3hlUUePaVq8VCqZzcO
	16rTDyrbR3SJYIYvCBniAyyI3P0d3ebOvdUt8QfnS3jcALAU9aXtrL1VTnk6pZ38HraM3hGDsZ6
	8whMAyh/Cv3EgZPN0bkwTcz9378NBAPwRrDxhXiv8
X-Gm-Gg: AYBFou1s9EN7QQnVcIm0xagyH8a7nzD5P5+uWnNmN3YipjZ26gmkJaHMs6QrjM4qSt7
	pqPEvnKmp48Us65nGsHAfxQ+m4druMsFQPs003X4Bgff7bJ2IB0pnOUZ66FDJpUhMHU5e1Kt3l2
	HfyX0eVI567kDcodKHkcmcjubIc+NYjfU+X5WN0U2m8bd0F+scfd9vUX/ivNw9NuDAJBv8HW4Fp
	1jPSM6NUIWyK91RYvV7C2ncBcmg8Z1zjF9Ga0ejtpU2FWTObsURWynhPtdWkDkUcjJPxNC87dfT
	tpt3Vmy7yNqE/8JdWEy9I0bPEdIF3QapB/ygWN5DtHTn8k9x3ZDxWfVp0Lr1abnRACXSI0E2Rtp
	et54JWkzB0w==
X-Received: by 2002:a05:600c:3593:b0:49a:d4d9:e417 with SMTP id
 5b1f17b1804b1-49e754445b3mr671735e9.6.1789316272535; Sun, 13 Sep 2026
 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org> <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
In-Reply-To: <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 13 Sep 2026 09:17:40 -0700
X-Gm-Features: AcwNN1UGrvqbq3HFY7pcrIOl_jX8tfzTKZIUJ5QTX30rH2G51YS_Yo5JvuNEb8Q
Message-ID: <CABdmKX2Oer9wrxWdR8s48Czro8H51HY+S_mfnUj-RvhjCM1RgA@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 8:47=E2=80=AFAM Chengfeng Lin <lin2530632123@gmail.=
com> wrote:
>
> Hi Tejun,
>
> Thanks. I found this during research into kernel performance regressions,
> using a microbenchmark of cgroup creation and removal. This was not
> prompted by a production issue.
>
> I reported it to document the added removal cost and ask whether some
> of it could be reduced while preserving the fixes. I agree that the
> roughly 3 us increase per removal does not, by itself, demonstrate a
> significant impact on real workloads.
>
> Thanks,
> Chengfeng
>
> Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=A5=E5=
=91=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hello,
> >
> > On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > > I found an increase in empty cgroup removal latency across 507d8ce13f=
5b
> > > ("kernfs: Don't set_nlink for directories being removed") and eea5d2b=
b34ba
> > > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabl=
ed,
> > > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
> > > The result held in two independent runs.
> >
> > I don't want to make cgroup removal unnecessarily expensive but at the =
same
> > time it's not an operation that I consider to be a hot path, so as long=
 as
> > the operaiton can finish in a reasonable amount of time and single digi=
t us
> > definitely is, performance of rmdir usually isn't something which is hi=
gh in
> > priority. Can you please detail why this matters for you?
> >
> > Thanks.
> >
> > --
> > tejun

Hi Chengfeng and Tejun,

We use this kernfs IN_DELETE_SELF feature on Android where multiple
cgroups are created and removed frequently on a per-application basis,
but we hadn't noticed a significant delay due to the inotify
functionality during cgroup removal. It's probably masked by much
larger delays (milliseconds) we regularly see due to unreleated issues
with cgroup locks like priority inversion with cgroup_mutex, and
contention for cgroup_threadgroup_rwsem.

As far as what we can do, I think avoiding inode lookups for kernfs
nodes that never had an inode created should improve the situation. It
doesn't eliminate the locking overhead, which I don't think can easily
be eliminated. The code below doesn't deal with inode eviction either,
but at least files which are never accessed won't introduce the inode
lookup overhead.

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 4f9ade82b08a..3ec9f79b1aa2 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1523,6 +1523,9 @@ static void kernfs_clear_inode_nlink(struct
kernfs_node *kn)
        struct kernfs_root *root =3D kernfs_root(kn);
        struct kernfs_super_info *info;

+       if (!(kn->flags & KERNFS_INODE_INITED))
+               return;
+
        lockdep_assert_held_read(&root->kernfs_supers_rwsem);

        list_for_each_entry(info, &root->supers, node) {
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 38b28aa7cd02..f8b4a8b8ade4 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -208,6 +208,10 @@ static void kernfs_init_inode(struct kernfs_node
*kn, struct inode *inode)
        set_default_inode_attr(inode, kn->mode);
        kernfs_refresh_inode(kn, inode);

+       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
+       kn->flags |=3D KERNFS_INODE_INITED;
+       up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
+
        /* initialize inode according to type */
        switch (kernfs_type(kn)) {
        case KERNFS_DIR:
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index e21b2f7f4159..87f074ce19d3 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -113,6 +113,7 @@ enum kernfs_node_flag {
        KERNFS_EMPTY_DIR        =3D 0x1000,
        KERNFS_HAS_RELEASE      =3D 0x2000,
        KERNFS_REMOVING         =3D 0x4000,
+       KERNFS_INODE_INITED     =3D 0x8000,
 };

-T.J.
