Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305681;
	b=f3R3zv2JCRB+aPy+Jdl/7JFXKNuJGCAOsUXRV7mOzkEsHnvBbryI+fkCN9k7lSQMLIg6
	 lCM8+/KsAD66VTTSVkmDOzOUgsGGgaADeU27Pn7OUSpVjWSkdYA0wkm7lvEYq/PzbLMWH
	 38s1K0qk8vRDckXZoIY0mMbaGlKm1DlK+37YG1JR4qgcFhi1bDRH5XaSKHtpz9XPiclWX
	 6YpV9DXrkg6EzXCT0CD16KLIkOk9ugT5iXullcVgUP5H4J36kzCUw0Pu9Oxwslyxr2RSM
	 OXrqEdEInfHE4sE2MKkiFqL34uriGrPk6LuC6FTgQg2kZTdPNgfDN+UtwUF6GVY9Gng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
	b=uGt/ClHok4XJDmcOrSZAF26U0Fy5eAGHKRqWqigENrqVZaQ/+sWavD3hBIszckIwvk0m
	 1M2i0WjdzZo4U9t1GxW5eZPyKvxE5uLOILBspbLcoqzMYYk3yZYoT0TPwr7ZQaF6q/dbL
	 2x4n9TQaqn52RcZyRtd4M7OkqhZmA66AB5CfXK4aFD7dsczLnJ4qSjb9a9PdI0WtWeiYP
	 FBmQoTGBw2jUrdqC8sdjsrzwpp/ArXeUwBRuFjKEyvnb6uPqQtebXcftVyWrP+xbFfHms
	 P5zEx5h30CcP9usfXZLlrgkf6+kHvi+FDkmSSx9TdMzTKqQ45WdSc5nkQDlhFyEumPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDdNrRSV;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E9606AA42
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3E9606AA42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDdNrRSV
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso3959806a12.0
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 02:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794305678; x=1794910478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=fDdNrRSVNR9TpZFUkHd2W1DuQHlvVUFibD6nEgoFL9wl5DSEDU143CIePeWmKV1eNo
         p2IeaviV4vP3RE1b0IAwmilqzagyYiEqwzgjXQIZxK/IRPy+x1ioxTws3516Ab/ZvS9D
         sAWqIxu2pfvu3ECnuFJ9J0QHkyT+t9gw05wbYDp7ttMZ6IzrNLgFSLMmxvohKdw2HI49
         PET6BrCja6mmQXbqqc3OHaaNKz9cPz28KJEow3UjQ8JYrlPXmEOjwVp7EDGjm7QVPcaO
         AqzXADEZQO9jfCT01HjEy0+su4njKuWs6asogL8j5zkyMWKdZi4vnWrQqpQ8hwcBKO51
         2pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305678; x=1794910478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=ivH4oPlSANc/xxeMRN/jC7VhnReOgyKMUMc+jvqAB0jHmP0x69S+PMJ1nmXuciV8nR
         5049Ua98XeE22e3qY72O1gzGwXZ1JFBKX0rxJkGSvP2flqOpxTaKEFO9zhww2Nax2NnL
         HkMhLdi+9trlmQHkqcRCOBa1W/Yfwxb2veJbNNBMVPTGq+YQLbWTT/JRc7uh+hFAZ1pI
         H1fWV/FCBGw3FWlYWkyrqtkCTNRALrijg95kx1rcsSQh0mdVRRyzPitWzSDWKBKi9zjV
         87iBHlmuCnYSkDYGgpdZZClrpB4AoavMXZviePKQ5X5RjYLpO5Nj0gDgdN3rN2d0KnU1
         nipw==
X-Forwarded-Encrypted: i=1; AL+hErG6oAG8Zhb0Gy+jiTPZLEW2ouRkQ6rfkRwY/FYniMIDdWsYWnW3okQ33L131azEcDxM6OOQukS+VrEnhg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+EtHM41yVVtjBakb3j7ZVzoERXCjtytmaJ4RnraIC/6fEONCWs
	pRYvsHW/71VzkRdibSwS+rnCn9g0PzgRDMpQFM6h/I2lTZzxTFS/tGf8
X-Gm-Gg: AYBFou1IjItG3XHQyyWif8NH0IAtfN8Jx8FuhjD+H5J9dUMd5tB2wtt0a7TfDshAztD
	C0FFJJ0GLrvFCbblVENetzQltCk49bO+4o+GzIS5ga4JUWPeXwGiYfQTR9ZnX9IR+nFOh1eUE0m
	wsFzev+BdA7DZLNGlqlYhYG+dXLEC3+Z0aUulHrBsS4C3N86sEMRA9x3buzXCpuYDYMcgYuBUto
	StGftMMOn3zXJbbXFNDT49EgHlrj26cUxDsaZ/GensmUmcQIE3qY34YoXoNZWUVSbvbkJNIAjML
	ynlrPUR2kV11imhKpNiQROgfH2kWAhAUHz1c9Es5L13RKLIVyyrdiCBgqDebRvBWOMK87T1uPdM
	pmFskAak08RcI+46x3q0FbWRrmK1UYD9mR0aM2I2yek5UlM7OKIoGs7OHDzT3jRkd1RVWP8y6HP
	WMOA8XYhfmRonNdzF2jzMq+1Lc6iA8ZFZHhjAQ51mrSVcXSX0fNL58RwLu4KiRC3ZerCHWFwndP
	Pj704xgDS/k1MCP7lwsDt2cncYFRYFZ8EbeAyOpzC6G4dG6L28i7bml3RbwCz7OgNDzld0Jr82R
	q5fn1r3eVa6eUOLNwGWhcxYZwR3H4n+gtBiCfJRnctAxwlliGJl1EnH+Uhs1nSuGG8E6Ge+aP7G
	0tIj98sii1Npl
X-Received: by 2002:a17:907:944d:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c504963ce05mr189793966b.44.1794305677695;
        Tue, 10 Nov 2026 02:14:37 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593eacsm90433466b.36.2026.11.10.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:14:36 -0800 (PST)
Date: Tue, 10 Nov 2026 11:14:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avLui6Mpf8GbKbtc@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>

On Tue, Nov 10, 2026 at 10:14:54AM +0100, Christian Brauner wrote:
> The fuse server can register any regular file as a backing file. procfs
> and binfmt_misc files are already refused by the stacking depth check as
> both set s_stack_depth to FILESYSTEM_MAX_STACK_DEPTH. sysfs and the
> other pseudo filesystems aren't. Reads and writes of the fuse file would
> then be done on the pseudo file with the fuse server's credentials.
> Refuse files on pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/fuse/backing.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 8c21a8a74efb..4e4fb810ddaa 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -147,6 +147,9 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
>  		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
>  			return -ELOOP;
>  
> +		if (file_is_pseudo(file))
> +			return -EINVAL;
> +
>  		fb->type = FUSE_BACKING_PATH;
>  		fb->path = file->f_path;
>  		path_get(&fb->path);
> 
> -- 
> 2.53.0
> 

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

