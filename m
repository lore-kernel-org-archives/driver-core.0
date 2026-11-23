Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447746;
	b=z3ewF4QfiTY7GXkO806SpGo1H1mhTU6pQiGsY1I2Xp8Zd0kJ9CUvy/MYt7NM+iZGY0WM
	 zGII8pJ9qV+Mr5Wa/QUX6JgJiMlBHgdsUKhDfqeD8v9ge5FrksxK6IhpY6hAIBNjYxzpq
	 9RBLfDRw9kufoGVXyb6in1+Bh4KEU+mr3GYNMQrBFd6tJcLTfZz2b86UHsdmNjG0tyB45
	 2n3+4w4AHtXe5N+Fjs6QrvMCAlkxcsF2zmdLU75cFtWg5pB/gZlqukZifE8foxdBkRII+
	 XHodxFRXQo0vnNwX6w/K1YzcSsT1xvL4KCp8Or7YIS8gAdjVnvPSVXk9g7QxmbVX+jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
	b=0jInZxBw/Y6yRIjN1UA8AkB/AMcB/qoTwXOJbIs/h92BMQgbpSyUljnQ6LISpUzIq66L
	 3d1QGaKBV7N/3eEhPRNOfcgH7lb4VxQZlbVQcR5GFlUqYuNTndEcdcKJu2oxqm6r4xvJR
	 2BIYCfcRL8w71UNhVUZ54cUfJpdOFk/qHSmcaaNBMML/EU9txk+pdCGToC54Q+tuz055x
	 ga3G2i9aRDN+w42PeiUS5jlL6dCIx+oI+1rSVxK6Mnbl59VmgoRIls+A7rV/9Js847AQk
	 Gnie6VFoeeZLukzV5hd75P9f3zTW3fPJhzpdHDCjBc7bRJ3l7mB5yJFABsg35d0OWdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gZEn9koT;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B114E606A31A
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 15:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B114E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gZEn9koT
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-537548b811aso29154051cf.3
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795447745; x=1796052545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
        b=gZEn9koTSc5kKwZ6QFAq2k7itG25aeQ1P/1B1oy6qdQ/YJfIe/YYqIN/LRz4A7j9a4
         udXAgl2Qqa8gtqlVseX61zmZp27lUQT5lFHKSCJh/llBWbjh+E3ZZ2Omi66Z7KouC05s
         WIChZGodznrqv4pvVFh7KN6lBQAzBKonkxCclQUidDSi+UpEfhb4ksS491sAxeoOdpbH
         hqlf1wnjsZEMhbG5NKTTnunD9tG80CNfVD+XZcccV4tf/57+Zy+VB7TRPls7pqFb1Vke
         LSNEZZa8f7IG+bwMPOdjEITLCY71V9FfDUKzPD982BXUTvmY4CFbGwyvlzJWrpOOr1ig
         f0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447745; x=1796052545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjgFR4G5OQ9juZKj9Y5T78qgRaR4MXSjWG7XFR0Z19k=;
        b=v5/8K5YAt/X5kv9g5MVu2cb9SgI04mgU+LhiurzExaBvn4Js8ifKZHdA6wt3Wg/Spv
         01htG9o8Tfgu5YrZH3d6uCE80iZiY38y1aC4GrXGPXqsOmnmhHALJVjyGLgIADa8owBZ
         wwZijTwUrLCVnb/FvG2lBuiWA4CZ1Foh8n6QmNe1RAxtS9211BlS5OH0HPn1Z9FESNy+
         gg+VJ1Nnx41X+7OQZ+qBCSbztoYKbW545gPR6abPVEfAUtZtDMv/zmLOoCfm1Szh395E
         a5T5zDEmeoDrWz5Va7Kp9Q8MrAv9mQsdSoWKFawlj9lal/DQSho6v1V0ORCg7g7CWJm4
         QmIA==
X-Forwarded-Encrypted: i=1; AL+hErGMxQW5VmFxa+8Qqm1SjpvmpE0bvualMjO9Yr0zmaib+ayp4SgJP+OYFN1GQq9cNq3v5WqMLfR3D/Mrwg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BHwCxgtlss6j3liIzppIVzY+rxo/s8BeSZMQvT88+bgb46PL4
	POmJefqiCGrw9wYkO4dMC26pcvM34I13Hl1/KMPiVH7alwIB5lU0+Iw9w8+zEbWmveE=
X-Gm-Gg: AZFdTZex+kLZXEWg77LONx0wYdNNIJKzm3ftjhZ8GG7DKUgFbl9Bx9jpL0hIQ/8P5tm
	VScFSYvYX9tKKCt6hZeTslGNeBQihHiq5OAqNsNSBTSOfAtUn57XHiOtTFlZ5zzHJd6Qy34XNc8
	JiYypyk2uJ4vGy62mELlKUfPtvak2WTakzburfr5x6h8AKQbxDJDxOZ8QahY2JlnWFoqrCn0wbu
	dcZiki9ObLZ6pMmQ5RjbVwh0n0ihMbIvOAk9HwgtXgXJUOcgV4DE/k72h+8QwlnevDfNYZBga2X
	6f+SQ/YpEqQFuyqrEg7xgAtBYaqtwyKx8mWIzAcU0wGE+KZHpb+O+ZlThS9U54s8xs82FLUKJsx
	Waqm+yVzCLPnxOoIBqhJNM5got878j0cQgJroqepx2b5cuFscWEpsmyuJZa1inYnLEqaJh3gIVg
	feCNaa3pvg4DN0qp5+Ai021hfplXiXVWz4LcKUGiADGy74wW0G1svb5TnJcVj6YORMmBGPgHmbz
	PBqDRl8Sb065MyKM/IeMfO4VIgVzvsVILt6Vrt/AsVIKE1JHtiJ/jxmN80a/bAlaZt3VtIaNm3R
	eEefLQZ5jFIr7gYZiTl/jqzM4ct37c3+k5h6CniS7XwsVZxq5dJTda0t0or+NcQgmRgI0IuqGrP
	feIg=
X-Received: by 2002:a05:622a:248c:b0:55d:3350:d270 with SMTP id d75a77b69052e-55d769f5705mr226617451cf.35.1795447744614;
        Mon, 23 Nov 2026 07:29:04 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm101253631cf.3.2026.11.23.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:29:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVyZ-00000000sUM-05ni;
	Mon, 23 Nov 2026 11:29:03 -0400
Date: Mon, 23 Nov 2026 11:29:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261123152903.GG179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-3-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Register the built-in TSM class with subsys_initcall() so it exists
> before a platform TSM driver probes, independently of object link order.
> CONFIG_TSM is boolean; remove the unused module exit path.

Why isn't it modular? This is going to force alot of stuff to be
non-modular.

Jason
