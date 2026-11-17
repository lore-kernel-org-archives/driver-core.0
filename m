Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903941;
	b=YTyC6i0tvM8pi6QsvF8ITupBk9XtKVKnPyoI6j+DF4BErBUktoSTG69k/r9SnqWtcWrn
	 kcURHEQnh6ToAzgZpaXTQaN2//b1gL5S7EKAwJIiiqzsrzU/UhLcq679ZM0LHf5Cty7Z3
	 UhVOj6XVoSXzDgluYnzPlqvl5hfylg7i+QDZEjgdMJXABQlIy+/U4YZrWaAM5Uz6F6Nfd
	 PmHwjGZaIQaDB9ACat9aSfnSsFabxf8qjtLz4N3jFXJZVzSQ+FPQOszF0I1OiInrm367W
	 tQWo/5nCzpYDlsd6n7xNLZLQuUQmICx8E2zEMJNllI0loJPEWwbdOL7laFuIVbUpsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
	b=qbZv324dQsXRTi32Qx6jC5e+y6MLlQiDUI8imXhBB/k3W02HHrbQYJAthsCdQG92EdUI
	 /jYx11VqqLQXVl+ovF6cvuQvWt8oNxBMhYXEOfLZiYKSy9d5fFJ5DXpGBevao8bk2HWsm
	 qEkQz/BPpz/CWbQ+K+pLbrdhwufpi3ozmCfeeEbftD++KJ29ZvDv6aAv0xQhJsXO3V2ot
	 ysnmaK4iBWNmRe6SvX8M9swzltFjLO1FYtDUc6Zo9iMgCaPK9BdOVumtXCBDXGg2YTaJj
	 5jdcWPQOQE9+P3v0gvY89UInVgFU2Bwhesn4ujzt74M3VmbwdbAeX1Mkay9UgbTSuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=piMT0ia1;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80F606A329
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC80F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=piMT0ia1
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so4521679f8f.3
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903939; x=1795508739; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=piMT0ia1t/K9qziJsImmHuFr4wsV/+kcb12WYrQqsKxCZOLaEL/kjkrpWEmwvB4shT
         u3Ce+SndVhNQ9GdkrVeglRQTPrK3N9k1ZqjNqZRFOU3tJHe/s20ifCftUTcb20Ghzy7T
         r3wDa/wR/XQzUom7TlaHKashup/N87G4n0rrB00zZRUpIjjksT9kWRNx13h5TgJYH3DM
         vxSqISdFDTS3wsgq3r/Y49PdQjHKkTBT8/XzHzbkbb+nwhN97BfRpAnKLJfqD4UCz0rA
         vaudwb2beXfmA9Drc8hnIZ15ieFKTA3Q+ndphF0riwk/ey73PGIbg9RPQdCRnkFbH3g8
         5Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903939; x=1795508739;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=Ln/rwR2VepkzDiDQVlwSdpm/rwgZJF1H9Ol4ffgNZrDE8rikSm1M0/M0EyEdStUlJI
         UwzFifkDUpBDPYGspKb/PAIwCC4vNQ/paSe9YiKrGDFCdjmJBleqPwW33281WKQRFAR+
         3jXd+CiXG9tvpYEyrQkNaTbBKtFNO7MwrRdMkwHjuzj5WhR8TxUAPyyHF7AunZCDx7jT
         70QI0NggNGFnn1Fz5swqLpT6vPRnRrN4qNhzcmP7fWaiU9kEBOf0Ege0WaT9qeKy6GPW
         ucLS964r/RzKycd/T8dt459dWBC4PKibRKvt6f33e7dx2xF0DegitBioR1pStlBwr5ZZ
         O5wQ==
X-Forwarded-Encrypted: i=1; AL+hErHefXi9bxtSF310VJN9f1uq3F5F1irJ7SGhfKwoWtdMudYBaXQ1tC9dzhQ4BsH1bEZ0NZdDwBMbmDAAEQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sSCsf+omoz9ITUSphwC9kza+mMrGU2kKAgaw9JwpLF9Y0gUZS
	Kv4w939/wlDQCWojgJoO2WemLX5zD8HmYrOxpO7akuChmtYpLejHJoEueasrJ2crPXGc
X-Gm-Gg: AZFdTZcEgd9VNlBWIBSklHGc1CVyh0c9NTYo2kILuKH6VH247EvYxacj+1ywISrOFZK
	uZmKkj9AORRl7Hmzqd7OsBx374XOyssKW+nb9zuK22ZDnqJrUchKbEZ3N/z6JDjXpTEGllXRjHx
	2V/Pxr6OHRIRnxvarrDei5FFZxoJJj8vRR6iZDrDFGpxFEfI3PMPX7GXXlEzb0vRJPrwXqaemEi
	LHvVs2L93BsU8zi1bszQofW/x6uQ5LcxIBCpHXA8zL34VCbI7t9+jEUV5CST1Ri1oGJZC1Ras+E
	t/W8l7zy/Mv5fXHyGsqb0+t8CkdGrFZ+vu+75luFHTkdzKhckCBorpg3ZCYzHKkrliOC+lpdpr1
	lDsTyaTE7k+Rqb/SVOiWkK7oB5wv4wL1QQx7sShm4PFmLtJqaLB5peFUyCKcMe8cxziZ1m4sTJC
	vXdwz+kwWU+kZn3VMt9Aunoz8DpUNumwLf0oPJtSSPooA9oXsvN3YEo6SFgooR1lg5mi3AyTWnn
	GpqhiptKAw/9Bok64bV8+giHJPF4RJ2+GBzCRe9Pg9cAOJfuj2OQZemqluVQ/hyiXKhjYannTDM
	mzHo1N4cakrjGzDqqaOSmez3ofSisrydO5IBuvZQcvnfEQL74M+tWOAmwaVP/reoG/gTlFCwvVh
	onpe6la5gQuEnflEojOHXHxWF3NqEYb79U2eQojCPJAuPMJWQ0vwtxjmX38NqJbOPvqK97ufPj8
	NHKg==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*
